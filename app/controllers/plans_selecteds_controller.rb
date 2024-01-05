class PlansSelectedsController < ApplicationController
  before_action :set_plans_selected, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_plan_selected

  # GET /plans_selecteds or /plans_selecteds.json
  def index
    if current_user.profile.super_adminstrador?
      @plans_selecteds = PlansSelected.includes(:plan)
    else
      @plans_selected = PlansSelected.find_by_user(current_user).first
      
      if @plans_selected
        redirect_to plans_selected_url(@plans_selected)
      else
        redirect_to plans_url(locale: I18n.locale)
      end
    end
  end

  # GET /plans_selecteds/1 or /plans_selecteds/1.json
  def show
  end

  # GET /plans_selecteds/new
  def new
    @plans_selected = PlansSelected.new
    redirect_to plans_url(locale: I18n.locale)
  end

  # GET /plans_selecteds/1/edit
  def edit
  end

  # POST /plans_selecteds or /plans_selecteds.json
  def create
    @plans_selected = PlansSelected.new(plans_selected_params)
    @plans_selected.user_id = current_user.id
    plan_selected = PlansSelected.find_by_user(current_user).take
  
    if plan_selected
      @plans_selected = plan_selected
      redirect_to @plans_selected and return
    end

    respond_to do |format|
      if @plans_selected.save
        format.html { redirect_to plans_selected_url(@plans_selected), notice: "Plans selected was successfully created." }
        format.json { render :show, status: :created, location: @plans_selected }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plans_selected.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /plans_selecteds/1/select


  # PATCH/PUT /plans_selecteds/1 or /plans_selecteds/1.json
  def update
    
    respond_to do |format|
      debugger
      if @plans_selected.update(plans_selected_params)
        format.html { redirect_to plans_selected_url(@plans_selected), notice: "Plans selected was successfully updated." }
        format.json { render :show, status: :ok, location: @plans_selected }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plans_selected.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans_selecteds/1 or /plans_selecteds/1.json
  def destroy
    plan_selected = PlansSelected.find_plan_selected_by_user(current_user)

    respond_to do |format|
      if plan_selected.activated 
        format.html { redirect_to plans_selected_url(plan_selected), info: "This Plan is activated. You can not delete." }
      else  
        @plans_selected.destroy
        format.html { redirect_to plans_selecteds_url(locale: I18n.locale), notice: "Plans selected was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
  
  def invalid_plan_selected
    logger.error "Attemped to access invalid Plan #{params[:id]}"
    redirect_to houses_url(locale: I18n.locale), info: "Invalid Plan."
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_plans_selected
      @plans_selected = PlansSelected.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plans_selected_params
      params.require(:plans_selected).permit(
        :day_used, 
        :duration, 
        :first_time, 
        :activated, 
        :plan_id
      )
    end

end
