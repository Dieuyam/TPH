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
  bedroom = page.xpath("/html/body/div[3]/div[5]/div/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/ul/li[2]").text.strip
  phone = page.xpath("/html/body/div[3]/div[12]/div/div/div[1]/a/@href").first.value
  type = page.xpath("//body/div[3]/div[5]/div/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/h2").text.strip
  ges = page.at_css('[class="info-detail"]')
  image = []
  img = page.xpath("/html/body/div[3]/div[5]/div/div[1]/div[1]").search("img").each do |img|
    image << img.attr('src')
  end
  
  type_of_operation = page.xpath("//body/div[3]/div[4]/div/h1").text.strip
  accomodation = {:image => image, :city => city, :living_space => living_space.tr("^0-9", '').to_i, :description => description, :rooms => rooms.tr("^0-9", '').to_i, :price => price.tr("^0-9", '').to_i, :phone => phone.tr("^0-9", ''), :type => type.to_s, :type_of_operation => type_of_operation, :price_per_month => price_per_month, :bedroom => bedroom}
  p "---- ONE ACCOMODATION ADD TO GOOGLE DRIVE ----"
  p accomodation
  return accomodation
rescue Exception => ex
  puts "An error of type #{ex.class} happened, message is #{ex.message}"
  retry
end

def includ(elem)
end


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
        puts "ohhhh calm down"
      end
    end
  end
  task :scrapmax2 => :environment do
    scrapmax("https://www.seloger.com/annonces/achat/maison/villecresnes-94/la-gare/147187365.htm?projects=2,5&types=1,2&natures=1,2,4&places=[{div:2238}]&enterprise=0&qsVersion=1.0&bd=ListToDetail")
  end

  task :google => :environment do
    require "google_drive"
    u = ENV['GOOGLE_KEY']
    io = StringIO.new(u)
    session = GoogleDrive::Session.from_service_account_key(io)
    ws = session.spreadsheet_by_key("1NxO5lRZIhqkrq2cG3N3pRaGXUHKOT8VjQO-dHMNM82E").worksheets[0]
    init_first_case = ws.rows.size + 1
    all_desc = []
    init_first_case.times do |i|
      all_desc << ws[i+1, 3]
    end
    array_of_good = []
    100.times do |i|
      all_url = scrap_all_href("https://www.seloger.com/list.htm?projects=2%2C5&types=1%2C2&natures=1%2C2%2C4&places=%5B%7Bdiv%3A2238%7D%5D&enterprise=0&qsVersion=1.0&LISTING-LISTpg=#{i+1}")
      all_url.each do |url|
        accomodation = scrapmax(url)
        unless all_desc.include? accomodation[:description]
          ws[init_first_case, 1] = accomodation[:price]
          if accomodation[:living_space] > 500
            accomodation[:living_space] = accomodation[:living_space]/10
          elsif accomodation[:living_space] > 1000
            accomodation[:living_space] = accomodation[:living_space]/100
          end
          ws[init_first_case, 2] = accomodation[:living_space]
          ws[init_first_case, 3] = accomodation[:description]
          ws[init_first_case, 4] = accomodation[:city]
          hascity = false
          City.all.each do |city|
            if accomodation[:city].downcase.tr(" -", "").tr("é", "e") == city.name.downcase.tr(" -", "").tr("é", "e")
              ws[init_first_case, 10] = city.id
              hascity = true
            end
          end
          if hascity == false
            new_city = City.create(:name => accomodation[:city])
            ws[init_first_case, 10] = new_city.id
          end
          ws[init_first_case, 5] = accomodation[:rooms]
          ws[init_first_case, 6] = accomodation[:phone]
          ws[init_first_case, 7] = url.to_s
          ws[init_first_case, 8] = accomodation[:price].to_f/accomodation[:living_space].to_f
          ws[init_first_case, 12] = accomodation[:type]
          if accomodation[:type_of_operation].include? "Vente"
            ws[init_first_case, 13] = "Vente"
          else
            ws[init_first_case, 13] = "Location"
          end
          ws[init_first_case, 14] = accomodation[:type_of_operation]
          ws[init_first_case, 15] = accomodation[:bedroom]
          puts accomodation[:image]
          accomodation[:image].each_with_index do |img, index|
            puts "here img => #{img}"
            ws[init_first_case, 16 +index] = img.to_s
          end
          init_first_case += 1
          ws.save
          ws.reload
        end
      end
    end
    ws.reload
  end

  task :create => :environment do
    puts "ok"
    require "google_drive"
    u = ENV['GOOGLE_KEY']
    io = StringIO.new(u)
    session = GoogleDrive::Session.from_service_account_key(io)
    ws = session.spreadsheet_by_key("1NxO5lRZIhqkrq2cG3N3pRaGXUHKOT8VjQO-dHMNM82E").worksheets[0]
    init_first_case = ws.rows.size - 1

    all_desc = []
    Accomodation.all.each do |i|
      all_desc << i.title
    end

    (init_first_case).times do |i|
      unless all_desc.include? ws[i+2, 14]
        hash_of_accomodation = {:road_number => rand(1..99),:heating => Heating.all.sample, :longitude=> 2.300, :latitude => 45.800, :orientation => 'est', :ges =>'A',:road_type => RoadType.all.sample, :type_of_property => TypeOfProperty.all.sample, :owner=> User.all.sample, :operation_type=> OperationType.all.sample, :floors_inside=> rand(1..3), :floor => rand(1..5), :country_id => 1, :road_name => Faker::Address.street_name, :price => ws[i+2, 1].to_i, :living_space => ws[i+2, 2].to_i, :rooms => ws[i+2, 5].to_i, :city_id => ws[i+2, 10].to_i, :title => ws[i+2, 14], :description => ws[i+2, 3] }
        new_accomodation = Accomodation.new(hash_of_accomodation)
        if new_accomodation.save
          puts "Accomodation n°#{new_accomodation.id} add in database"
          url = 'https:'+ws[i+2, 16]
          filename = File.basename(URI.parse(url).path)
          file = URI.open(url)
          new_accomodation.photo.attach(io: file, filename: filename)
          url = 'https:'+ws[i+2, 17]
          filename = File.basename(URI.parse(url).path)
          file = URI.open(url)
          new_accomodation.photo.attach(io: file, filename: filename)
        end
      end
    end
  end
  task :addimg => :environment do
    require 'uri'
    ac = Accomodation.find(9)
    puts ac.title
    puts ac.city
    url = 'https://images.ladepeche.fr/api/v1/images/view/5deccbe28fe56f0b1f4f47a7/large/image.jpg?v=1'
    filename = File.basename(URI.parse(url).path)
    file = URI.open('https://images.ladepeche.fr/api/v1/images/view/5deccbe28fe56f0b1f4f47a7/large/image.jpg?v=1')
    ac.photo.attach(io: file, filename: filename)
  end
  task :city => :environment do


    all_city = []
    City.all.each do |city|
      all_city << city.name.downcase.tr(" -", "").tr("é", "e")
    end
    require "google_drive"
    u = ENV['GOOGLE_KEY']
    io = StringIO.new(u)
    session = GoogleDrive::Session.from_service_account_key(io)
    ws = session.spreadsheet_by_key("1NxO5lRZIhqkrq2cG3N3pRaGXUHKOT8VjQO-dHMNM82E").worksheets[0]
    init_first_case = ws.rows.size - 1
    init_first_case.times do |i|
      unless all_city.include? ws[i+2, 4].downcase.tr(" -", "").tr("é", "e")
        c = City.create(:name => ws[i+2, 4])
        ws[i+2, 10] = c.id
      else
        City.all.each do |city|
          if city.name.downcase.tr(" -", "").tr("é", "e") == ws[i+2, 4].downcase.tr(" -", "").tr("é", "e")
            ws[i+2, 10] = city.id
            if city.zipcode != nil
              ws[i+2, 11] = city.zipcode
            end
          end
        end
        puts "City are now sinc"
        ws.save
        ws.reload
      end
    end
  end
end
