class AccomodationsController < ApplicationController
  layout 'application_for_accomodation'
  before_action :set_accomodation, only: [:show, :edit, :update, :destroy]

  # GET /accomodations
  # GET /accomodations.json
  def index
    city_id = params[:city][:id].to_i

    if city_id == 0
      @accomodations = Accomodation.all
    else
      @accomodations = []
      Accomodation.where(city_id: city_id).find_each do |accomodation|
        @accomodations << accomodation
      end

    end

  end

  # GET /accomodations/1
  # GET /accomodations/1.json
  def show
  end

  # GET /accomodations/new
  def new
    @accomodation = Accomodation.new
  end

  # GET /accomodations/1/edit
  def edit
  end

  # POST /accomodations
  # POST /accomodations.json
  def create
    puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  end

  # PATCH/PUT /accomodations/1
  # PATCH/PUT /accomodations/1.json
  def update
    respond_to do |format|
      if @accomodation.update(accomodation_params)
        format.html { redirect_to @accomodation, notice: 'Accomodation was successfully updated.' }
        format.json { render :show, status: :ok, location: @accomodation }
      else
        format.html { render :edit }
        format.json { render json: @accomodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accomodations/1
  # DELETE /accomodations/1.json
  def destroy
    @accomodation.destroy
    respond_to do |format|
      format.html { redirect_to accomodations_url, notice: 'Accomodation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accomodation
      @accomodation = Accomodation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accomodation_params
      params.require(:accomodation).permit(:road_number)
    end
end
