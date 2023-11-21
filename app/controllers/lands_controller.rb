class LandsController < ApplicationController
  before_action :set_land, only: %i[ show edit update destroy]
  before_action :authenticate_user!, except: [ :show, :index, :show_images]
  before_action :get_profile, only: [ :create ]
  before_action :is_creator?, only: [ :update, :destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_land

  include LandsConcerns
  include ProfileLandsConcerns
  include ImageConcerns
  include BelongsAnotherUserMessageConcerns


  # GET /lands or /lands.json
  def index
    @lands = Land.all.order(id: :desc).page(params[:page])
  end

  # GET /lands/1 or /lands/1.json
  def show
      @profile = ProfileLand.find_land_by_land(@land).profile

  end

  # GET /lands/search
  def search  
    
    @lands = Land.search_by(params)
    debugger
    if @lands.empty?
      redirect_to lands_url, 
        info: "Nenhum terreno encontrado. Sugerimos estes ímóveis para você."
    else
      flash[:info] = "Resultado da busca."
    end
  end
  
  # GET	/lands/:land_id/show_images
  def show_images
    @land = Land.find(params[:land_id])
    @profile = ProfileLand.find_land_by_land(@land).profile
  end

  # GET /lands/new
  def new
    @land = Land.new
    @land.build_address
    @land.build_dimention
  end

  def publisher 
    land = Land.new 
    land.id = params[:id]
    owner_land = User.find_user_by_land(land)
    
    LandMailer.publisher(
      params[:client_name], 
      params[:client_email],  
      params[:client_message], 
      owner_land, 
      land)
           .deliver_later
  end

  # GET /lands/1/edit
  def edit
  end

  # POST /lands or /lands.json
  def create

    @land = Land.new(land_params)
    
    respond_to do |format|
      if !@land.images.attached?
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @land.errors, status: :unprocessable_entity }
      elsif @profile.nil?
        format.html { redirect_to new_profile_path, info: "You must to create a profile after create a land." }
        format.json { render json: ["You must to create a profile after create a land."], status: :unprocessable_entity }
      elsif @profile.cliente?
        format.html { redirect_to new_profile_path, info: "You are a simple client. Change your profile to create a land." }
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
    
    if @is_creator
      respond_to do |format|
        if @land.update(land_params)
          format.html { redirect_to land_url(@land), notice: "Land was successfully updated." }
          format.json { render :show, status: :ok, location: @land }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @land.errors, status: :unprocessable_entity }
        end
      end
    else
      belongs_another_user_message(format, @land, "Land")
    end

  end

  # DELETE /lands/1 or /lands/1.json
  def destroy
    respond_to do |format|
      if @is_creator
        @land.destroy
          format.html { redirect_to lands_url, notice: "Land was successfully destroyed." }
          format.json { head :no_content }
      else
        belongs_another_user_message(format, @land, "Land")
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

    def invalid_land 
      logger.error "Attemped to access invalid land #{params[:id]}"
      redirect_to lands_url, info: "This land doesn't exit."
    end

    def is_creator?
      @is_creator = ProfileLand.is_creator_or_admin_land?(current_user, @land)
    end

    # Only allow a list of trusted parameters through.
    def land_params
      params.require(:land).permit(
        :title_land, 
        :description, 
        :price, 
        :dimention_id, 
        :province_code,
        :city_code,
        address_attributes: [:id, :street, :city_id, :_destroy],
        dimention_attributes: [:id, :width_d, :height_d, :_destroy ],
        images: []
      )
    end
end