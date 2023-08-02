module LandsConcerns
    extend ActiveSupport::Concern
    
    def is_image_uploaded?(array_image)
      array_image != [""]
    end

end