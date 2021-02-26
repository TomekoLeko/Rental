class DuesController < ApplicationController
  before_action :set_due, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy, :show]

  # GET /dues
  # GET /dues.json
  def index
    @dues = current_user.dues
    @tenant_dues = current_user.dues.select { |due| due.tenant_id != nil }
    @bills = current_user.dues.select { |bill| bill.property_id != nil }
    @due_types = current_user.due_types
    @tenants = current_user.tenants
    @properties = current_user.properties
    @dues.each do |due|

    days_left = due.payment_date - Date.today
    left_to_pay = due.amount - due.paid_amount

    if left_to_pay >0
      if days_left < 0
    due.status = 2
      end
      if (days_left < 4) && (days_left >=0)
        due.status = 1
      end
    end
    #   if  left_to_pay <= 0
    #    due.status = 3
    #  end
    
    due.save
    end
  end

  # GET /dues/1
  # GET /dues/1.json
  def show
  end

  # GET /dues/new
  def new
    @due = current_user.dues.build
    @due_types = current_user.due_types
    @properties = current_user.properties
    @tenants = current_user.tenants
  end

  # GET /dues/1/edit
  def edit
    @properties = current_user.properties
    @tenants = current_user.tenants
    @due_types = current_user.due_types
    @to_pay = @due.amount - @due.paid_amount
  end

  # POST /dues
  # POST /dues.json
  def create
    @properties = current_user.properties
    @tenants = current_user.tenants
    @agreements = current_user.agreements
    @due = current_user.dues.build(due_params)
    @tenant_due = current_user.dues.build(due_params)

    if @due.property_id && @agreements.find_by(property_id: @tenant_due.property_id)
      id_to_assign = @agreements.find_by(property_id: @tenant_due.property_id).tenant_id
      @tenant_due.tenant_id = id_to_assign
      @tenant_due.property_id = nil 
      respond_to do |format|
        if @due.save && @tenant_due.save
            format.html { redirect_to @due, notice: 'Bill to pay and due to collect were successfully created.' }
            format.json { render :show, status: :created, location: @due }
        else
            format.html { render :new }
            format.json { render json: @due.errors, status: :unprocessable_entity }
        end
      end
    else  
      respond_to do |format|
        if  @due.save    
            format.html { redirect_to @due, notice: 'Bill to pay was successfully created.' }
            format.json { render :show, status: :created, location: @due }  
        else
            format.html { render :new }
            format.json { render json: @due.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PATCH/PUT /dues/1
  # PATCH/PUT /dues/1.json
  def update
    to_add = @due.paid_amount
    respond_to do |format|
      if @due.update(due_params)
        format.html { redirect_to @due, notice: 'Due was successfully updated.' }
        format.json { render :show, status: :ok, location: @due }
      else
        format.html { render :edit }
        format.json { render json: @due.errors, status: :unprocessable_entity }
      end
      @due.paid_amount +=to_add
      left_to_pay = @due.amount - @due.paid_amount
     if  left_to_pay <= 0
      @due.status = 3
    end
    @due.save
    end
  end

  # DELETE /dues/1
  # DELETE /dues/1.json
  def destroy
    @due.destroy
    respond_to do |format|
      format.html { redirect_to dues_url, notice: 'Due was successfully canceled.' }
      format.json { head :no_content }
    end
  end

  def correct_user 
    @due = current_user.dues.find_by(id: params[:id])
    redirect_to dues_path, alert: 'Not Authorized to edit this type' if @due.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_due
      @due = Due.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def due_params
      params.require(:due).permit(:due_type_id, :agreement_id, :property_id, :tenant_id, :period_from, :period_to, :amount, :paid_amount, :paid_on, :payment_date, :user_id, :status)
    end
end
