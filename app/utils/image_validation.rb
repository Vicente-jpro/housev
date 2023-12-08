class ImageValidation 
    attr_accessor :image_name
    def initialize(image_name)
      @image_name = image_name
    end
    #jpg or png
    def is_valid_format?
      jpg = @image_name.match(".jpg")
      png = @image_name.match(".png")
      gif = @image_name.match(".gif")

      return (".jpg" == jpg.to_s) || (".png" == png.to_s) || (".gif" == gif.to_s)
    end
end

