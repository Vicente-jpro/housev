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
    if @lands.empty?
      redirect_to lands_url(locale: I18n.locale), 
        info: t('controllers.land.info.no-properties-found')
    else
      flash[:info] = t('controllers.land.info.search-result')
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
    
    has_valid_plan = PlansSelected.find_plan_selected_by_user(current_user)
    respond_to do |format|
      if !@land.images.attached?
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @land.errors, status: :unprocessable_entity }
      elsif !is_valid_format?(@land.images)
        format.html { redirect_to new_land_path(@land), alert: t('controllers.land.info.image-format-invalid') }
        format.json { render json: [t('controllers.land.info.image-format-invalid')], status: :unprocessable_entity }
      elsif @profile.nil?
        format.html { redirect_to new_profile_path, info: t('controllers.land.info.profile') }
        format.json { render json: [t('controllers.land.info.profile')], status: :unprocessable_entity }
      elsif @profile.cliente?
        format.html { redirect_to new_profile_path, info: t('controllers.land.info.client') }
        format.json { render json: [t('controllers.land.info.client')], status: :unprocessable_entity }
      elsif has_valid_plan.activated
        if @land.save
          create_profile_land(@profile, @land)
          format.html { redirect_to land_url(@land), notice: t('controllers.land.success.created') }
          format.json { render :show, status: :created, location: @land }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @land.errors, status: :unprocessable_entity }
        end
      else 
        format.html { redirect_to plans_path, alert:  t('controllers.land.info.you-have-to-have-avalid-plan') }
        format.json { render json: [ t('controllers.land.info.you-have-to-have-avalid-plan')], status: :unprocessable_entity }
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
          format.html { redirect_to land_url(@land), notice: t('controllers.land.success.updated') }
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
          format.html { redirect_to lands_url(locale: I18n.locale), notice: t('controllers.house.success.destroy') }
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
      logger.error "#{t('controllers.land.info.invalid')} #{params[:id]}"
      redirect_to lands_url(locale: I18n.locale), info: "This land doesn't exit."
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