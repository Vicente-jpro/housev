class ProfileLandsController < ApplicationController
  before_action :set_profile_land, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /profile_lands or /profile_lands.json
  def index
    @profile_land = ProfileLand.find_all_lands_by_user(current_user)
    @page = "index"
  end

  # GET /profile_lands/1 or /profile_lands/1.json
  def show
  end

  # GET /profile_lands/1/edit
  def edit
  end

  # POST /profile_lands or /profile_lands.json
  def create
    @profile_land = ProfileLand.new(profile_land_params)

    respond_to do |format|
      if @profile_land.save
        format.html { redirect_to profile_land_url(@profile_land), notice: "Profile land was successfully created." }
        format.json { render :show, status: :created, location: @profile_land }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile_land.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_lands/1 or /profile_lands/1.json
  def update
    respond_to do |format|
      if @profile_land.update(profile_land_params)
        format.html { redirect_to profile_land_url(@profile_land), notice: "Profile land was successfully updated." }
        format.json { render :show, status: :ok, location: @profile_land }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile_land.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_lands/1 or /profile_lands/1.json
  def destroy
    @profile_land.destroy

    respond_to do |format|
      format.html { redirect_to profile_lands_url, notice: "Profile land was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_land
      @profile_land = ProfileLand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_land_params
      params.require(:profile_land).permit(:profile_id, :land_id)
    end
end
