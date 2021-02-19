class DuesController < ApplicationController
  before_action :set_due, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy, :show]

  # GET /dues
  # GET /dues.json
  def index
    @dues = Due.all
    @due_types = current_user.due_types

  end

  # GET /dues/1
  # GET /dues/1.json
  def show
  end

  # GET /dues/new
  def new
    @due = current_user.dues.build
    @due_types = DueType.all
    @properties = current_user.properties
    @tenants = current_user.tenants
  end

  # GET /dues/1/edit
  def edit
    @properties = current_user.properties
    @tenants = current_user.tenants
  end

  # POST /dues
  # POST /dues.json
  def create
    @due = current_user.dues.build(due_params)
    respond_to do |format|
      if @due.save
        format.html { redirect_to @due, notice: 'Due was successfully created.' }
        format.json { render :show, status: :created, location: @due }
      else
        format.html { render :new }
        format.json { render json: @due.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dues/1
  # PATCH/PUT /dues/1.json
  def update
    respond_to do |format|
      if @due.update(due_params)
        format.html { redirect_to @due, notice: 'Due was successfully updated.' }
        format.json { render :show, status: :ok, location: @due }
      else
        format.html { render :edit }
        format.json { render json: @due.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dues/1
  # DELETE /dues/1.json
  def destroy
    @due.destroy
    respond_to do |format|
      format.html { redirect_to dues_url, notice: 'Due was successfully deleted.' }
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
      params.require(:due).permit(:due_type_id, :rent_id, :property_id, :tenant_id, :period_from, :period_to, :amount, :paid_amount, :paid_at, :payment_date, :user_id)
    end
end
