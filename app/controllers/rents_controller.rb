class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /rents
  # GET /rents.json
  def index
    @rents = Rent.all
    @properties = current_user.properties
    @tenants = current_user.tenants
  end

  # GET /rents/1
  # GET /rents/1.json
  def show
  end

  # GET /rents/new
  def new
    @rent = Rent.new
    @properties = current_user.properties.where(rented: false)
    @tenants = current_user.tenants.where(resident: false)
  end

  # GET /rents/1/edit
  def edit
    @properties = current_user.properties.where(id: @rent.property_id)
    @tenants = current_user.tenants.where(id: @rent.tenant_id)
  end

  # POST /rents
  # POST /rents.json
  def create
    @rent = Rent.new(rent_params)
    property = current_user.properties.find_by_id(@rent.property_id)
    tenant = current_user.tenants.find_by_id(@rent.tenant_id)
    property.update_attribute(:rented, true)
    tenant.update_attribute(:resident, true)
    respond_to do |format|
      if @rent.save
        format.html { redirect_to @rent, notice: 'Rent was successfully created.' }
        format.json { render :show, status: :created, location: @rent }
      else
        format.html { render :new }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rents/1
  # PATCH/PUT /rents/1.json
  def update
    property = current_user.properties.find_by_id(@rent.property_id)
    tenant = current_user.tenants.find_by_id(@rent.tenant_id)
    property.update_attribute(:rented, true)
    tenant.update_attribute(:resident, true)
    respond_to do |format|
      if @rent.update(rent_params)
        format.html { redirect_to @rent, notice: 'Rent was successfully updated.' }
        format.json { render :show, status: :ok, location: @rent }
      else
        format.html { render :edit }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents/1
  # DELETE /rents/1.json
  def destroy
    property = current_user.properties.find_by_id(@rent.property_id)
    tenant = current_user.tenants.find_by_id(@rent.tenant_id)
    property.update_attribute(:rented, false) if property
    tenant.update_attribute(:resident, false) if tenant
    @rent.destroy
    respond_to do |format|
      format.html { redirect_to rents_url, notice: 'Rent was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = Rent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rent_params
      params.require(:rent).permit(:from, :to, :payment_date, :rent, :deposit, :property_id, :tenant_id)
    end
end
