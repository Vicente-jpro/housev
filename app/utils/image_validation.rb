class ImageValidation 
    attr_accessor :array_images
    def initialize(array_images)
      @array_images = array_images
    end
    #jpg or png
    def is_valid_format?
      count = 0
      while @array_images.size > count 
        jpeg = @array_images[count].filename.to_s.match(".jpeg")
        jpg = @array_images[count].filename.to_s.match(".jpg")
        png = @array_images[count].filename.to_s.match(".png")
        gif = @array_images[count].filename.to_s.match(".gif")
     

       # !((".jpg" == jpg.to_s) || (".png" == png.to_s)  || (".gif" == gif.to_s) || (".jpeg" == jpeg.to_s))
       
        count += 1
      end

      return true
    end
end

