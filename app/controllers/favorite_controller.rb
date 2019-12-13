class FavoriteController < ApplicationController
  before_action :authenticate_user!
  def create
    already_like = Favorite.where(:user_id => current_user.id, :accomodation_id => params[:accomodation_id])
    if already_like.size == 0
      Favorite.create(:user_id => current_user.id, :accomodation_id => params[:accomodation_id])
    else
      Favorite.where(:user_id => current_user.id, :accomodation_id => params[:accomodation_id]).first.destroy
    end
  end

end
