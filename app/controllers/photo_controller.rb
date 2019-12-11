class PhotoController < ApplicationController

  before_action :set_accomodation,:owner_verififcation, only: [:create, :update, :destroy]

  def create
    @accomodation.photo.attach(params[:photo]) if params[:photo]
    redirect_to(accomodation_path(@accomodation))
  end


  # def destroy
  #   @accomodation = Accomodation.find(params[:accomodation_id])
	# @accomodation.photo.destroy
  #   respond_to do |format|
  #     format.html { redirect_to accomodations_url, notice: 'Accomodation was successfully destroyed.' }
  #     #forma
  # end

  private

  def set_accomodation
    @accomodation = Accomodation.find(params[:accomodation_id])
  end

  def owner_verififcation

    case
    when current_user.id != @accomodation.owner_id
      flash[:notice] = "Acces denied"
      render @accomodation

    end

  end

end
