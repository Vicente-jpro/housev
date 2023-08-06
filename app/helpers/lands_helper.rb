module LandsHelper
    # def is_index_page?(page_name)
    #     !@page.nil? and @page == page_name
    # end

    def get_four_images(images)
      new_images = []
      count = 0
      images.each do 
        if count == 4
            return new_images
        end
        new_images << images[ count ]
        count += 1
      end 

     return  new_images
    end
end
