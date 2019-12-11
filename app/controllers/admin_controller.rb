class AdminController < ApplicationController
	  layout 'application_for_admin'
	  before_action :is_admin?

end
