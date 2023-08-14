module LandsConcerns
    extend ActiveSupport::Concern
    
    def is_image_uploaded?(array_image)
      array_image != [""]
    end

    def is_land_creator?(user)
      land = Land.find_lands_by_user(user)
      !land.nil?
    end

end