module LandsConcerns
    extend ActiveSupport::Concern

     def is_land_creator?(user)
       land = Land.find_lands_by_user(user)
       return !land.empty?
     end

    def is_land_creator?(user, land)
      land = Land.find_land_by_user(user, land)
      return !land.empty?
    end
    
end