class ContactController < ApplicationController
	def index
	end


	def create
    message = params[:message]
    phone = params[:phone]
    email = params[:email]
    first_name = params[:name]
    ContactMailer.admin_contact_email(message,first_name,email,phone).deliver_now
	end
end
