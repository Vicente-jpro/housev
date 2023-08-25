class FavoriteHousesController < ApplicationController
  before_action :set_favorite_house, only: %i[ show edit update destroy ]
  
  add_flash_types :info
  include HousesConcerns

  # GET /favorite_houses or /favorite_houses.json
  def index
    @favorite_houses = FavoriteHouse.all
  end

  # GET /favorite_houses/1 or /favorite_houses/1.json
  def show
  end

  # GET /favorite_houses/new
  def new
    @favorite_house = FavoriteHouse.new
  end

  # GET /favorite_houses/1/edit
  def edit
  end

  # POST /favorite_houses or /favorite_houses.json
  def create
    @favorite_house = FavoriteHouse.new(favorite_house_params)

    respond_to do |format|
      if @favorite_house.save
        format.html { redirect_to favorite_house_url(@favorite_house), notice: "Favorite house was successfully created." }
        format.json { render :show, status: :created, location: @favorite_house }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_houses/1 or /favorite_houses/1.json
  def update
    respond_to do |format|
      if @favorite_house.update(favorite_house_params)
        format.html { redirect_to favorite_house_url(@favorite_house), notice: "Favorite house was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite_house }
      else
        format.html { render :edit, status: :unprocessable_entity }
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
    def set_favorite_house
      @favorite_house = FavoriteHouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_house_params
      params.require(:favorite_house).permit(:profile_id, :house_id)
    end
end
