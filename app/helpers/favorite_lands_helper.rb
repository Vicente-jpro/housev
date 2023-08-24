module FavoriteLandsHelper

    def favorite_land_built(land)
      if current_user.nil?
        return land
      elsif
          profile = Profile.find_by_user(current_user)
          perfil_exist = !profile.nil?

          if perfil_exist and user_signed_in?
            favorite_land = FavoriteLand.new 
            favorite_land.profile_id = profile.id
            favorite_land.land_id = land.id 
            return favorite_land
          else
            redirect_to new_profile_path
          end
      end
        
    end
end
