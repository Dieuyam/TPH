class MonProfilController < ApplicationController
	def index
		@users = User.all
		@user = current_user
	end
end
