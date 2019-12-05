class PhotoController < ApplicationController
  def create
    @accomodation = Accomodation.find(params[:accomodation_id])
    @accomodation.photo.attach(params[:photo])
    redirect_to(accomodation_path(@accomodation))
  end
end
