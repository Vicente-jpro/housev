class LandsController < ApplicationController
  before_action :set_land, only: %i[ show edit update destroy]
  before_action :authenticate_user!, except: [ :show, :index, :show_images]
  before_action :get_profile, only: [ :create ]
  
  include LandsConcerns
  include ProfileLandsConcerns


  # GET /lands or /lands.json
  def index
    @lands = Land.order(id: :desc)
  end

  # GET /lands/1 or /lands/1.json
  def show
    @profile = ProfileLand.find_land_by_land(@land).profile
    @profile
  end
  
  # GET	/lands/:land_id/show_images
  def show_images
    @land = Land.find(params[:land_id])
    @profile = ProfileLand.find_land_by_land(@land).profile
    @profile
  end

  # GET /lands/new
  def new
    @land = Land.new
    @land.build_address
    @land.build_dimention
  end

  # GET /lands/1/edit
  def edit
  end

  # POST /lands or /lands.json
  def create
    @land = Land.new(land_params)
    
    respond_to do |format|
      if @profile.nil?
        format.html { redirect_to new_profile_path, notice: "You must to create a profile after create a land." }
        format.json { render json: ["You must to create a profile after create a land."], status: :unprocessable_entity }
      elsif @land.save
        create_profile_land(@profile, @land)
        format.html { redirect_to land_url(@land), notice: "Land was successfully created." }
        format.json { render :show, status: :created, location: @land }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @land.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lands/1 or /lands/1.json
  def update

    if !is_image_uploaded?(params[:land][:images]) 
      params[:land][:images] << set_land.images
    end
    respond_to do |format|
      if @land.update(land_params)
        format.html { redirect_to land_url(@land), notice: "Land was successfully updated." }
        format.json { render :show, status: :ok, location: @land }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @land.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lands/1 or /lands/1.json
  def destroy
    is_creator = ProfileLand.is_creator_land?(current_user, @land)
    respond_to do |format|
      if is_creator
        @land.destroy
          format.html { redirect_to lands_url(@land), status: :unprocessable_entity, notice: "Land was successfully destroyed." }
          format.json { head :no_content }
      else
        format.html { redirect_to lands_url,  notice: "This land belongs to another user." }
        format.json { head :no_content }
      end
    
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_land
      @land = Land.find(params[:id])
    end

    def get_profile
      @profile = Profile.find_by_user(current_user)
    end

    # Only allow a list of trusted parameters through.
    def land_params
      params.require(:land).permit(
        :title_land, 
        :description, 
        :price, 
        :dimention_id, 
        address_attributes: [:id, :street, :city_id, :_destroy],
        dimention_attributes: [:id, :width_d, :height_d, :_destroy ],
        images: []
      )
    end
end