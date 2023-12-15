class PlansSelectedsController < ApplicationController
  before_action :set_plans_selected, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /plans_selecteds or /plans_selecteds.json
  def index
    @plans_selecteds = PlansSelected.all
  end

  # GET /plans_selecteds/1 or /plans_selecteds/1.json
  def show
  end

  # GET /plans_selecteds/new
  def new
    @plans_selected = PlansSelected.new
    redirect_to plans_url
  end

  # GET /plans_selecteds/1/edit
  def edit
  end

  # POST /plans_selecteds or /plans_selecteds.json
  def create
    @plans_selected = PlansSelected.new(plans_selected_params)
    @plans_selected.user_id = current_user.id
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

  # PATCH/PUT /plans_selecteds/1 or /plans_selecteds/1.json
  def update
    respond_to do |format|
      plans_selected_params[:duration] = plans_selected_params[:duration].to_i
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
    @plans_selected.destroy

    respond_to do |format|
      format.html { redirect_to plans_selecteds_url, notice: "Plans selected was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plans_selected
      @plans_selected = PlansSelected.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plans_selected_params
      params.require(:plans_selected).permit(:day_used, :duration, :plan_id)
    end
end
