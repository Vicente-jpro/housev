module FavoriteHousesHelper

    def favorite_house_built(house)
        if current_user.nil? 
          return house
        elsif
            profile = Profile.find_by_user(current_user)
            perfil_exist = !profile.nil?
  
            if perfil_exist and user_signed_in?
              favorite_house = FavoriteHouse.new 
              favorite_house.profile_id = profile.id
              favorite_house.house_id = house.id 
              return favorite_house
            else
              redirect_to new_profile_path
            end
        end
          
    end

end
