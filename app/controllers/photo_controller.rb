class PhotoController < ApplicationController
  def create
    @accomodation = Accomodation.find(params[:accomodation_id])
    @accomodation.photo.attach(params[:photo])
    redirect_to(accomodation_path(@accomodation))
  end


  # def destroy
  #   @accomodation = Accomodation.find(params[:accomodation_id])
	# @accomodation.photo.destroy
  #   respond_to do |format|
  #     format.html { redirect_to accomodations_url, notice: 'Accomodation was successfully destroyed.' }
  #     #forma
  # end
end
