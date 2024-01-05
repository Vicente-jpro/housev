class FavoriteLandsController < ApplicationController
  before_action :set_favorite_land, only: %i[ destroy ]
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_land 

  include LandsConcerns

  # GET /favorite_lands or /favorite_lands.json
  def index
    @favorite_lands = FavoriteLand.find_all_by_user(current_user).page(params[:page])
  end

  # POST /favorite_lands or /favorite_lands.json
  def create
    @favorite_land = FavoriteLand.new(favorite_land_params)
    favorite = FavoriteLand.new 
    favorite.land_id = @favorite_land[:land_id]
    land = Land.new 
    land.id = favorite.land_id

    respond_to do |format|
      if is_land_creator?(current_user, land) 
        format.html { redirect_to lands_url(locale: I18n.locale), 
          alert: t('controllers.favorite.land.info.creator') }
      elsif !FavoriteLand.exist?(favorite)
        format.html { redirect_to lands_url(locale: I18n.locale), 
              alert: t('controllers.favorite.house.info.already-added')  }
      elsif @favorite_land.save
        format.html { redirect_to lands_url(locale: I18n.locale), notice: t('controllers.favorite.house.success.created')}
        format.json { render :show, status: :created, location: @favorite_land }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_land.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_lands/1 or /favorite_lands/1.json
  def destroy
    land = Land.new 
    land.id =  @favorite_land.land_id
    
    @favorite_land = FavoriteLand.find_favorite_by_user_and_land(current_user, land)
    @favorite_land.destroy

    respond_to do |format|
      format.html { redirect_to favorite_lands_url(locale: I18n.locale), notice:  t('controllers.favorite.land.success.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_land
      @favorite_land = FavoriteLand.find(params[:id])
    end

    def invalid_land 
      logger.error "Attempt to access invalid land #{params[:id]}"
      redirect_to lands_url(locale: I18n.locale), info: "Invalid land."
    end

    # Only allow a list of trusted parameters through.
    def favorite_land_params
      params.require(:favorite_land).permit(:profile_id, :land_id)
    end
end
