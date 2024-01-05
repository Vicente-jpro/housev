class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :set_profile_by_user_id, only: [ :new, :update ]

  include ProfilesConcerns

  # GET /profiles or /profiles.json
  def index
    @profiles = Profile.includes(:user, :address)
  end

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new

   if !@profile.nil?
      respond_to do |format| 
        format.html { redirect_to profile_url(@profile) }
        format.json { render :show, status: :created, location: @profile}
      end
   else
      @profile = Profile.new
      @profile.build_address
   end
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    
    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
         
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy
    

    respond_to do |format|
      format.html { redirect_to profiles_url(locale: I18n.locale), notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end
    
    def set_profile_by_user_id 
      @profile ||= Profile.find_by_user_id(current_user.id)
      @profile
    end
    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(
        :name_profile, 
        :phone1, 
        :phone2, 
        :profile_type, 
        :gender,
        :image,
        address_attributes: [:id, :street, :city_id, :_destroy] 
      )
    end

end
