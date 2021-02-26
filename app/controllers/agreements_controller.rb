class AgreementsController < ApplicationController
  before_action :set_agreement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy, :show]

  # GET /agreements
  # GET /agreements.json
  def index
    @agreements = Agreement.all
    @properties = current_user.properties
    @tenants = current_user.tenants
  end

  # GET /agreements/1
  # GET /agreements/1.json
  def show
  end

  # GET /agreements/new
  def new
    @agreement = current_user.agreements.build
    @properties = current_user.properties.where(rented: false)
    @tenants = current_user.tenants.where(resident: false)
  end

  # GET /agreements/1/edit
  def edit
    @properties = current_user.properties.where(id: @agreement.property_id)
    @tenants = current_user.tenants.where(id: @agreement.tenant_id)
  end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = Agreement.new(agreement_params)
    @agreements = current_user.agreements.build(agreement_params)
    property = current_user.properties.find_by_id(@agreement.property_id)
    tenant = current_user.tenants.find_by_id(@agreement.tenant_id)
    property.update_attribute(:rented, true)
    tenant.update_attribute(:resident, true)
    respond_to do |format|
      if @agreement.save
        format.html { redirect_to @agreement, notice: 'Agreement was successfully created.' }
        format.json { render :show, status: :created, location: @agreement }
      else
        format.html { render :new }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agreements/1
  # PATCH/PUT /agreements/1.json
  def update
    property = current_user.properties.find_by_id(@agreement.property_id)
    tenant = current_user.tenants.find_by_id(@agreement.tenant_id)
    property.update_attribute(:rented, true)
    tenant.update_attribute(:resident, true)
    respond_to do |format|
      if @agreement.update(agreement_params)
        format.html { redirect_to @agreement, notice: 'Agreement was successfully updated.' }
        format.json { render :show, status: :ok, location: @agreement }
      else
        format.html { render :edit }
        format.json { render json: @agreement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreements/1
  # DELETE /agreements/1.json
  def destroy
    property = current_user.properties.find_by_id(@agreement.property_id)
    tenant = current_user.tenants.find_by_id(@agreement.tenant_id)
    property.update_attribute(:agreemented, false) if property
    tenant.update_attribute(:resident, false) if tenant
    @agreement.destroy
    respond_to do |format|
      format.html { redirect_to agreements_url, notice: 'Agreement was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def correct_user 
    @agreements = current_user.agreements.find_by(id: params[:id])
    redirect_to agreements_path, alert: 'Not Authorized to edit this type' if @agreement.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agreement_params
      params.require(:agreement).permit(:from, :to, :payment_date, :rent, :deposit, :property_id, :tenant_id, :user_id)
    end
end
