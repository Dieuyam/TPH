class AccomodationsController < ApplicationController
  before_action :set_accomodation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /accomodations
  # GET /accomodations.json
  def index
    # city_id = params[:city][:id].to_i
    #
    # if city_id == 0
    #   @accomodations = Accomodation.all
    # else
    #   @accomodations = []
    #   Accomodation.where(city_id: city_id).find_each do |accomodation|
    #     @accomodations << accomodation
    #   end
    #
    # end
    @accomodations = Accomodation.all #get_search_result(search_params)

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

    a = Accomodation.new(title: accomodation_params[:title], description: accomodation_params[:description], road_number: accomodation_params[:road_number].to_i, road_name: accomodation_params[:road_name], zipcode: accomodation_params[:zipcode], living_space: accomodation_params[:zipcode].to_f, price: accomodation_params[:price].to_f, floors_inside: accomodation_params[:floors_inside].to_i, rooms: accomodation_params[:rooms].to_i, orientation: accomodation_params[:orientation], ges:accomodation_params[:ges], type_of_property: TypeOfProperty.find(accomodation_params[:type_of_property_id].to_i), operation_type: OperationType.find(accomodation_params[:operation_type_id].to_i), city: City.find(accomodation_params[:city_id].to_i), country: Country.all.sample,owner: current_user)

    if a.save

      #Création critère tertiaire grace aux cases cochées
      params["accomodation"].to_unsafe_h.each_with_index { |(key,value),index|

        if index >= 14
          if value == "1"
            puts key
            JoinTableTertiary.create(accomodation: a, tertiary_criteria_id: index - 13)
          end

        end
      }

    end

    redirect_to root_path
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
    params.require(:accomodation).permit(:title, :description, :road_number, :operation_type_id, :type_of_property_id, :road_name, :road_type_id, :zipcode, :city_id, :living_space, :floor, :floors_inside, :rooms, :orientation, :heating_id, :ges, :price,:balcony, :terrace, :basement, :elevator, :pool, :concierge, :parking, :last_floor, :garden, :disabled_access, :furnished)
  end

  def search_params
    #Stocker les paramètres de la recherche de l'utilsateur

    tab = Hash.new

    params[:rooms]? tab[:rooms] = params[:rooms] : tab[:rooms] = 0
    params[:search]? tab[:search] = params[:search] : tab[:search] = ""
    params[:city]? tab[:city_id] = params[:city][:id] : tab[:city_id] = 0

    tab[:criteria] = Hash.new
    user_criteria = [""]
    user_criteria = params[:criteria_ids] unless params[:criteria_ids].nil?


    if params[:criteria_ids]

      user_criteria.include?('1')? tab[:criteria][:pool] = 0 : tab[:criteria][:pool] = 1
      user_criteria.include?('2')? tab[:criteria][:elevator] = 0 : tab[:criteria][:elevator] = 1
      user_criteria.include?('3')? tab[:criteria][:basement] = 0 : tab[:criteria][:basement] = 1
      user_criteria.include?('4')? tab[:criteria][:balcony] = 0 : tab[:criteria][:balcony] = 1
      user_criteria.include?('5')? tab[:criteria][:concierge] = 0 : tab[:criteria][:concierge] = 1
      user_criteria.include?('6')? tab[:criteria][:parking] = 0 : tab[:criteria][:parking] = 1
      user_criteria.include?('7')? tab[:criteria][:last_floor] = 0 : tab[:criteria][:last_floor] = 1
      user_criteria.include?('8')? tab[:criteria][:disabled_access] = 0 : tab[:criteria][:disabled_access] = 1
      user_criteria.include?('9')? tab[:criteria][:garden] = 0 : tab[:criteria][:garden] = 1
      user_criteria.include?('10')? tab[:criteria][:furnished] = 0 : tab[:criteria][:furnished] = 1

    end

    return tab

  end

end
