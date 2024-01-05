class HousesController < ApplicationController
  before_action :set_house, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, 
    except: [ :show, :index, :show_images, :search, :search_advanced, :rent, :buy]
  before_action :get_profile, only: [ :create ]
  before_action :is_creator?, only: [ :update, :destroy ]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_house

  include ImageConcerns
  include HousesConcerns
  include ProfileHousesConcerns
  include BelongsAnotherUserMessageConcerns

  # GET /houses or /houses.json
  def index
    @houses = House.find_all.page(params[:page])
  end

  # GET /houses/1 or /houses/1.json
  def show
    @profile = Profile.find_by_house(@house)
    user = User.new 
    
    user.id = @profile.user_id
    @houses = House.find_houses_by_user(user)
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

  def rent
    @houses = House.rent.page(params[:page])
  end

  def buy 
    @houses = House.buy.page(params[:page])
  end

  # GET /houses/search_advanced
  def search_advanced 
    @houses = House.search_advanced_by(params)
    
    if @houses.empty?
      redirect_to houses_url(locale: I18n.locale), 
        info: t('controllers.house.info.no-properties-found')
    else
      flash[:info] = t('controllers.house.info.search-result')
    end
  end
  
  # GET /houses/search
  def search  
    @houses = House.search_by(params)
    if @houses.empty?
      redirect_to houses_url(locale: I18n.locale), 
        info: t('controllers.house.info.no-properties-found')
    else
      flash[:info] = t('controllers.house.info.search-result')
    end
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses or /houses.json
  def create
    @house = House.new(house_params)
    has_valid_plan = PlansSelected.find_plan_selected_by_user(current_user)
    respond_to do |format|
      if !@house.house_images.attached?
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      elsif !is_valid_format?(@house.house_images) 
        format.html { redirect_to new_house_path(@house), alert: t('controllers.house.info.image-format-invalid') }
        format.json { render json: [ t('controllers.house.info.image-format-invalid') ], status: :unprocessable_entity }
      elsif @profile.nil? 
        format.html { redirect_to new_profile_path, info: t('controllers.house.info.profile') }
        format.json { render json: [t('controllers.house.info.profile')], status: :unprocessable_entity }
      elsif @profile.cliente? 
        format.html { redirect_to new_profile_path, info: t('controllers.house.info.client') }
        format.json { render json: [t('controllers.house.info.client')], status: :unprocessable_entity }
      elsif has_valid_plan.activated
        if @house.save 
          format.html { redirect_to house_url(@house), notice: t('controllers.house.success.created') }
          format.json { render :show, status: :created, location: @house }
        else
          @house.build_address
          @house.build_location 
          @house.build_dimention
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @house.errors, status: :unprocessable_entity }
        end
      else  
        format.html { redirect_to plans_path, info:  t('controllers.house.info.you-have-to-have-avalid-plan')  }
        format.json { render json: [t('controllers.house.info.you-have-to-have-avalid-plan')], status: :unprocessable_entity }
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
          format.html { redirect_to house_url(@house), notice: t('controllers.house.success.updated') }
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
        format.html { redirect_to houses_url(locale: I18n.locale), notice: t('controllers.house.success.destroy') }
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
      logger.error "#{t('controllers.house.info.invalid')} #{params[:id]}"
      redirect_to houses_url(locale: I18n.locale), info: "Invalid house."
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
        :city_code,
        :client_name, 
        :client_email, 
        :client_message,
        address_attributes: [:id, :street, :city_id, :_destroy],
        dimention_attributes: [:id, :width_d, :height_d, :_destroy ],
        location_attributes: [:id, :latitude, :longitude, :_destroy ],
        house_images:[])
    end
end