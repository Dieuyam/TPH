class ContactController < ApplicationController
	def index
	end 


	def create 
      @message = params[:message]
      @phone = params[:phone]
      @email = params[:email]
      @name = params[:name] 

	end 
end
