class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]
  # before_action :check_payment_owner, only: [:index, :create]
  skip_before_action :verify_authenticity_token  

  # GET /charges
  # GET /charges.json
  def index
    @charge = Charge.new
    respond_to do |format|
      if @charge.save
        format.html { redirect_to user_path(:id => $stripe_customer.id), notice: 'Payment was succesfull.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /charges/1
  # GET /charges/1.json
  def show
  end

  # GET /charges/new
  def new
    @charge = Charge.new
  end

  # GET /charges/1/edit
  def edit
  end

  # POST /charges
  # POST /charges.json
  def create
    @charge = Charge.new
    respond_to do |format|
      if @charge.save
        format.html { redirect_to @charge, notice: 'Charge was successfully created.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charges/1
  # PATCH/PUT /charges/1.json
  def update
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @charge, notice: 'Charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @charge }
      else
        format.html { render :edit }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.json
  def destroy
    @charge.destroy
    respond_to do |format|
      format.html { redirect_to charges_url, notice: 'Charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.fetch(:charge, {})
    end

    # def check_payment_owner
    #   case 
    #   when current_user.stripe_customer_id != params[:id]
    #     redirect_to user_path(:id => current_user.id), alert: "Vous n'avez pas accès à cette action veuillez passer par le processus de paiment Stripe"
    #   end
    #  end
    
end
