class HousesController < ApplicationController
  before_action :set_house, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, 
    except: [ :show, :index, :show_images, :search, :search_advanced]
  before_action :get_profile, only: [ :create ]
  before_action :is_creator?, only: [ :update, :destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_house

  include ImageConcerns
  include HousesConcerns
  include ProfileHousesConcerns
  include BelongsAnotherUserMessageConcerns

  # GET /houses or /houses.json
  def index
    @houses = House.includes(:address, :dimention, :location).page(params[:page])
  end

  # GET /houses/1 or /houses/1.json
  def show
    #  begin
     
        @profile = Profile.find_by_house(@house)
        user = User.new 
    
        user.id = @profile.user_id
        @houses = House.find_houses_by_user(user)
      # debugger
    #  rescue => exception
    #    #This house doesn't have a profile
    #    @house.destroy
    #    redirect_to house_url, info: "House destroyed because doesn't have a profile."
    #  end
  end
  
  # GET	/houses/:house_id/show_images
  def show_images
    @house = House.find(params[:house_id])
  end

  # GET /houses/new
  def new
    @house = House.new
    @house.build_address
    @house.build_location 
    @house.build_dimention
  end

  def publisher 
    house = House.new 
    house.id = params[:id]
    owner_house = User.find_user_by_house(house)
    
    HouseMailer.publisher(
      params[:client_name], 
      params[:client_email],  
      params[:client_message], 
      owner_house, 
      house)
           .deliver_later
  end
  # GET /houses/search_advanced
  def search_advanced 
    @houses = House.search_advanced_by(params)
    
    if @houses.empty?
      redirect_to houses_url, 
        info: "Nenhum imóvel encontrado. Sugerimos estes ímóveis para você."
    else
      flash[:info] = "Resultado da busca."
    end
  end
  
  # GET /houses/search
  def search  
    @houses = House.search_by(params)
    if @houses.empty?
      redirect_to houses_url, 
        info: "Nenhum imóvel encontrado. Sugerimos estes ímóveis para você."
    else
      flash[:info] = "Resultado da busca."
    end
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses or /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if !@house.house_images.attached?
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      elsif @profile.nil?
        format.html { redirect_to new_profile_path, info: "You must to create a profile after create a house." }
        format.json { render json: ["You must to create a profile after create a house."], status: :unprocessable_entity }
      elsif @profile.cliente?
        format.html { redirect_to new_profile_path, info: "You are a simple client. Change your profile to create a house." }
        format.json { render json: ["You must to create a profile after create a house."], status: :unprocessable_entity }
      elsif @house.save
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
    if !is_image_uploaded?(params[:house][:house_images]) 
      params[:house][:house_images] << set_house.house_images
    end
    respond_to do |format|
      if @is_creator
        if@house.update(house_params) 
          format.html { redirect_to house_url(@house), notice: "House was successfully updated." }
          format.json { render :show, status: :ok, location: @house }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @house.errors, status: :unprocessable_entity }
        end
      else  
        belongs_another_user_message(format, @house, "House")
      end
    end
  end

  # DELETE /houses/1 or /houses/1.json
  def destroy
    
    respond_to do |format|
      if @is_creator
        @house.destroy
        format.html { redirect_to houses_url, notice: "House was successfully destroyed." }
        format.json { head :no_content }
      else
        belongs_another_user_message(format, @house, "House")
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    def invalid_house 
      logger.error "Attemped to access invalid house #{params[:id]}"
      redirect_to houses_url, info: "Invalid house."
    end

    def get_profile
      @profile = Profile.find_by_user(current_user)
    end

    def is_creator?
      @is_creator = ProfileHouse.is_creator_or_admin_house?(current_user, @house)
    end
    # Only allow a list of trusted parameters through.
    def house_params
      params.require(:house).permit(
        :room, 
        :title, 
        :living_room, 
        :bath_room, 
        :yard, 
        :kitchen, 
        :balcony, 
        :condition, 
        :type_negotiation, 
        :price, 
        :garage, 
        :pool, 
        :description, 
        :tipology, 
        :next_by, 
        :furnished, 
        :property_type, 
        :province_code,
        :client_name, 
        :client_email, 
        :client_message,
        address_attributes: [:id, :street, :city_id, :_destroy],
        dimention_attributes: [:id, :width_d, :height_d, :_destroy ],
        location_attributes: [:id, :latitude, :longitude, :_destroy ],
        house_images:[])
    end
end