class HousesController < ApplicationController
  before_action :set_house, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :show, :index, :show_images]

  # GET /houses or /houses.json
  def index
    @houses = House.all
  end

  # GET /houses/1 or /houses/1.json
  def show
    @profile = ProfileLand.find_land_by_land(@land).profile
    @profile
  end
  
  # GET	/lands/:house_id/show_images
  def show_images
    @house = House.find(params[:house_id])
    @profile = ProfileLand.find_land_by_land(@land).profile
    @profile
  end

  # GET /houses/new
  def new
    @house = House.new
    @house.build_address
    @house.build_location 
    @house.build_dimention
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses or /houses.json
  def create
    @house = House.new(house_params)
    debugger
    respond_to do |format|
      if @house.save
        debugger
        format.html { redirect_to house_url(@house), notice: "House was successfully created." }
        format.json { render :show, status: :created, location: @house }
      else
        @house.build_address
        @house.build_location 
        @house.build_dimention
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1 or /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to house_url(@house), notice: "House was successfully updated." }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1 or /houses/1.json
  def destroy
    @house.destroy

    respond_to do |format|
      format.html { redirect_to houses_url, notice: "House was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def house_params
      params.require(:house).permit(
        :room, 
        :title, 
        :living_room, 
        :bath_room, 
        :yeard, 
        :kitchen, 
        :balcony, 
        :condition, 
        :type_negotiation, 
        :price, 
        :garage, 
        :pool, 
        :discription, 
        :tipology, 
        :next_by, 
        :furnished, 
        :property_type, 
        address_attributes: [:id, :street, :city_id, :_destroy],
        dimention_attributes: [:id, :width_d, :height_d, :_destroy ],
        location_attributes: [:id, :latitude, :longitude, :_destroy ],
        house_images:[])
    end
end
