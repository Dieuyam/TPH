class PhotoController < ApplicationController

  before_action :verify_user, only: [:create, :update, :destroy]

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

  def owner_verififcation

    case
    when current_user.id != @accomodation.owner_id
      flash[:notice] = "Acces denied"
    end
  
  end

end
