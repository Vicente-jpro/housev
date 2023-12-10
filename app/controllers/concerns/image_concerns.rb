module ImageConcerns
    extend ActiveSupport::Concern
    
    def is_image_uploaded?(array_image)
      array_image != [""]
    end

    def is_valid_format?(array_images)
      count = 0
      while array_images.size > count 
        jpeg = array_images[count].filename.to_s.match(".jpeg")
        jpg = array_images[count].filename.to_s.match(".jpg")
        png = array_images[count].filename.to_s.match(".png")
        gif = array_images[count].filename.to_s.match(".gif")
     
        is_true = ((".jpg" == jpg.to_s) || (".png" == png.to_s)  || (".gif" == gif.to_s) || (".jpeg" == jpeg.to_s))
        if !is_true 
         return false
        end
        count += 1
      end
      return true
    end

end