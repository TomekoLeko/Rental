class DueTypesController < ApplicationController
  before_action :set_due_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy, :show]

  # GET /due_types
  # GET /due_types.json
  def index
    @due_types = DueType.all
  end

  # GET /due_types/1
  # GET /due_types/1.json
  def show
  end

  # GET /due_types/new
  def new
    @due_type = current_user.due_types.build
  end

  # GET /due_types/1/edit
  def edit
  end

  # POST /due_types
  # POST /due_types.json
  def create
    # @due_type = DueType.new(due_type_params)
    @due_types = current_user.due_types
    @due_type = current_user.due_types.build(due_type_params)
    respond_to do |format|
      if @due_types.find_by(name: @due_type.name) 
        format.html { redirect_to due_types_path, alert: 'This due type already exists.' }
        format.json { render json: @due_type.errors, status: :unprocessable_entity }
      elsif  @due_type.save
        format.html { redirect_to due_types_path, notice: 'Due type was successfully created.' }
        format.json { render :show, status: :created, location: @due_type }
      else
        format.html { render :new }
        format.json { render json: @due_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /due_types/1
  # PATCH/PUT /due_types/1.json
  def update
    respond_to do |format|
      if @due_type.update(due_type_params)
        format.html { redirect_to @due_type, notice: 'Due type was successfully updated.' }
        format.json { render :show, status: :ok, location: @due_type }
      else
        format.html { render :edit }
        format.json { render json: @due_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /due_types/1
  # DELETE /due_types/1.json
  def destroy
    if  current_user.dues.find_by(due_type_id: @due_type.id)
      redirect_to due_types_path, alert: 'You cannot delete. This type is in use.'
    else  
    @due_type.destroy
    respond_to do |format|
      format.html { redirect_to due_types_url, notice: 'Due type was successfully deleted.' }
      format.json { head :no_content }
    end  
    end
  end

  def correct_user 
    @due_type = current_user.due_types.find_by(id: params[:id])
    redirect_to due_types_path, alert: 'Not Authorized to edit this type' if @due_type.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_due_type
      @due_type = DueType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def due_type_params
      params.require(:due_type).permit(:name, :user_id)
    end
end
