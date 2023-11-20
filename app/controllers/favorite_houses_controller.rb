class FavoriteHousesController < ApplicationController
  before_action :set_favorite_house, only: %i[ show edit update destroy ]
  before_action :set_house_url
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_favorite_house

  include HousesConcerns

   # GET /favorite_houses or /favorite_houses.json
   def index
    @favorite_houses = FavoriteHouse.find_all_by_user(current_user).page(params[:page])
  end

  # POST /favorite_houses or /favorite_houses.json
  def create
    @favorite_house = FavoriteHouse.new(favorite_house_params)
    favorite = FavoriteHouse.new 
    favorite.house_id = @favorite_house[:house_id]
    house = House.new 
    house.id = favorite.house_id
    
    respond_to do |format|
      if is_house_creator?(current_user, house)
        format.html { redirect_to houses_url, 
          alert: "You are the house creator. It's impossible mark as favorite." }
      elsif !FavoriteLand.exist?(favorite)
        format.html { redirect_to houses_url, 
              alert: "This house is already added as a favorite." }
      elsif @favorite_house.save
        format.html { redirect_to houses_url, notice: "Favorite house was successfully created." }
        format.json { render :show, status: :created, location: @favorite_house }
        
        @owner_house = User.find_user_by_house(house)
        @client = Profile.find_by_user(current_user)

        FavoriteHouseMailer
          .with(
              owner_house:  @owner_house, 
              client: @client, 
              url: @url
        ).deliver_leter
        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_houses/1 or /favorite_houses/1.json
  def destroy
    @favorite_house.destroy

    respond_to do |format|
      format.html { redirect_to favorite_houses_url, notice: "Favorite house was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_land
      @favorite_house = FavoriteLand.find(params[:id])
    end

    def set_house_url
      @url = request 
    end

    def invalid_land 
      logger.error "Attempt to access invalid house #{params[:id]}"
      redirect_to houses_url, info: "Invalid house."
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_house
      @favorite_house = FavoriteHouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_house_params
      params.require(:favorite_house).permit(:profile_id, :house_id)
    end
end
