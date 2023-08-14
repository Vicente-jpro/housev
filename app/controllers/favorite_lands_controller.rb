class FavoriteLandsController < ApplicationController
  before_action :set_favorite_land, only: %i[ destroy ]
  before_action :authenticate_user!
  include LandsConcerns

  # GET /favorite_lands or /favorite_lands.json
  def index
    @favorite_lands = FavoriteLand.find_all_by_user(current_user)
  end

  # POST /favorite_lands or /favorite_lands.json
  def create
    @favorite_land = FavoriteLand.new(favorite_land_params)
    favorite = FavoriteLand.new 
    favorite.land_id = @favorite_land[:land_id]
    
    respond_to do |format|
      if is_land_creator?(current_user)
        format.html { redirect_to lands_url, 
          alert: "You are the land creator. It's impossible mark as favorite." }
      elsif !FavoriteLand.exist?(favorite)
        format.html { redirect_to lands_url, 
              alert: "This land is already added as a favorite." }
      elsif @favorite_land.save
        format.html { redirect_to lands_url, notice: "Favorite land was successfully created." }
        format.json { render :show, status: :created, location: @favorite_land }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_land.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_lands/1 or /favorite_lands/1.json
  def destroy
    @favorite_land.destroy

    respond_to do |format|
      format.html { redirect_to favorite_lands_url, notice: "Favorite land was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_land
      @favorite_land = FavoriteLand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_land_params
      params.require(:favorite_land).permit(:profile_id, :land_id)
    end
end
