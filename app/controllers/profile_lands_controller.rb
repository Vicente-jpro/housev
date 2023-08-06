class ProfileLandsController < ApplicationController
  before_action :authenticate_user!
  # GET /profile_lands or /profile_lands.json
  def index
    @lands = Land.find_lands_by_user(current_user)
   # @page = "index"
  end

  private
    # Only allow a list of trusted parameters through.
    def profile_land_params
      params.require(:profile_land).permit(:profile_id, :land_id)
    end
end
