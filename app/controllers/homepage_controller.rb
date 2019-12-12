class HomepageController < ApplicationController
 

  def index
  		@random_accommodation=[]
	   for i in  1..6
	   		@random_accommodation << Accomodation.all.sample
	   end 

  end
end
