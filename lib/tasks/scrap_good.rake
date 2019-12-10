require 'rubygems'
require 'nokogiri'
require 'open-uri'

def getting_some_proxies
 page = Nokogiri::HTML(open("https://free-proxy-list.net/"))
 proxies = []
 300.times do |i|
   proxies << "http://" + page.xpath("//tbody/tr[#{i}]/td[1]").text + ":" + page.xpath("//tbody/tr[#{i}]/td[2]").text
 end
 return proxies
end

def myip
  starting = Time.now
  proxies = getting_some_proxies
  random_proxy = proxies.sample
  puts random_proxy
  page = Nokogiri::HTML(open("http://www.mon-ip.com/", proxy: URI.parse(random_proxy)))
  puts "IP PROXY :" + page.search('#ip4').text
  ending = Time.now
  elapsed = ending - starting
  puts elapsed.round(2).to_s+ " secondes"
rescue
  puts " ------- Timeout retry scrapping -------"
  retry
end

def scrap_all_href(page_url)
  starting = Time.now
  proxies = getting_some_proxies
  random_proxy = proxies.sample
  all_url = []
  page = Nokogiri::HTML(open(page_url, proxy: URI.parse(random_proxy)))
  32.times do |i|
    if page.xpath("//div[2]/div/div/div[3]/div/div[2]/div[#{i}]/div[1]/div[1]/div/a/@href").first.to_s.include? "www.seloger.com"
      all_url << page.xpath("//div[2]/div/div/div[3]/div/div[2]/div[#{i}]/div[1]/div[1]/div/a/@href").to_s
    end
  end
  return all_url
rescue Exception => ex
  puts "An error of type #{ex.class} happened, message is #{ex.message}"
  retry
end

def scrapmax(page_url)
  starting = Time.now
  proxies = getting_some_proxies
  random_proxy = proxies.sample
  page = Nokogiri::HTML(open(page_url, proxy: URI.parse(random_proxy)))
  price = page.xpath("//body/div[3]/div[5]/div/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/a[1]").text.strip
  price_per_month = page.xpath("//body/div[3]/div[5]/div/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/a[2]").text.strip
  living_space = page.xpath("//body/div[3]/div[5]/div/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/ul/li[3]").text.strip
  description = page.xpath("//div/form/input[23]/@value").first.value 
  city = page.xpath("//div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/p").text
  rooms = page.xpath("/html/body/div[3]/div[5]/div/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/ul/li[1]").text.strip
  phone = page.xpath("/html/body/div[3]/div[12]/div/div/div[1]/a/@href").first.value 
  ges = page.at_css('[class="info-detail"]')
  accomodation = {:city => city.to_i, :living_space => living_space.tr("^0-9", '').to_i, :description => description, :rooms => rooms.tr("^0-9", '').to_i, :price => price.tr("^0-9", '').to_i, :phone => phone.tr("^0-9", '')}
  return accomodation
rescue Exception => ex
  puts "An error of type #{ex.class} happened, message is #{ex.message}"
  retry
end


def includ(elem)
end



#-------------------------------------------TASK--------------------------------------------  

namespace :scrap_good do
  task :scrap_proxies => :environment do
    myip
  end
  task :scrapmax => :environment do
    array_of_good = []
    10.times do |i|
      all_url = scrap_all_href("https://www.seloger.com/list.htm?projects=2%2C5&types=1%2C2&natures=1%2C2%2C4&places=%5B%7Bdiv%3A2238%7D%5D&enterprise=0&qsVersion=1.0&LISTING-LISTpg=#{i+1}")
      all_url.each do |url|
        scrapmax(url)
      end
    end

  end
  task :scrapmax2 => :environment do
    scrapmax("https://www.seloger.com/annonces/achat/maison/villecresnes-94/la-gare/147187365.htm?projects=2,5&types=1,2&natures=1,2,4&places=[{div:2238}]&enterprise=0&qsVersion=1.0&bd=ListToDetail")
  end
  task :google => :environment do
    require "google_drive"

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md

session = GoogleDrive::Session.from_service_account_key("config.json")
ws = session.spreadsheet_by_key("1NxO5lRZIhqkrq2cG3N3pRaGXUHKOT8VjQO-dHMNM82E").worksheets[0]

all_desc = []
init_first_case.times do |i|
all_desc << ws[i, 3]
end


array_of_good = []
10.times do |i|
  all_url = scrap_all_href("https://www.seloger.com/list.htm?projects=2%2C5&types=1%2C2&natures=1%2C2%2C4&places=%5B%7Bdiv%3A2238%7D%5D&enterprise=0&qsVersion=1.0&LISTING-LISTpg=#{i+1}")
  all_url.each do |url|
    init_first_case = ws.rows.size
    accomodation = scrapmax(url)
    unless all_desc.include? accomodation[:description]
    ws[init_first_case, 1] = accomodation[:price]
    ws[init_first_case, 2] = accomodation[:living_space]
    ws[init_first_case, 3] = accomodation[:description]
    ws[init_first_case, 4] = accomodation[:city]
    ws[init_first_case, 5] = accomodation[:rooms]
    ws[init_first_case, 6] = accomodation[:phone]
    ws.save
    ws.reload
  end
  end
end

# Gets content of A2 cell.

=begin
# Dumps all cells.
(1..ws.num_rows).each do |row|
  (1..ws.num_cols).each do |col|
    p ws[row, col]
  end
end
=end

# Yet another way to do so.
#p ws.rows  #==> [["fuga", ""], ["foo", "bar]]

# Reloads the worksheet to get changes by other clients.
ws.reload
end
end