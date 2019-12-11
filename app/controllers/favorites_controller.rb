class FavoritesController < ApplicationController

    def create
        Favorite.create(:user_id => current_user.id, :accomodation_id => params[:id])
    end

end
