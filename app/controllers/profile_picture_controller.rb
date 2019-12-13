class ProfilePictureController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.profile_picture.attach(params[:profile_picture])
    redirect_to(mon_profil_index_path)
  end
end
