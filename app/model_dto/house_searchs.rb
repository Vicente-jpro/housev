require '../model/house.rb'
class HouseSearchs 
    attr_accessor :room, :title, :living_room, :bath_room, :yard, :kitchen, :balcony,
    :condition, :type_negotiation, :price, :garage, :pool, :description, :tipology,
    :next_by, :furnished, :property_type, :city_code, :province_code, :dimention, :location

    def initialize(*args)
      @args = *args
    end

    def to_house_model
        @house = House.new
        @house.room = @room
        @house.title = @title
        @house.living_room = @living_room
        @house.bath_room = @bath_room
        @house.yard = @yard
        @house.kitchen = @kitchen
        @house.balcony = @balcony
        @house.condition = @condition
        @house.type_negotiation = @type_negotiation
        @house.price = @price
        @house.garage = @garage
        @house.pool = @pool
        @house.description = @description
        @house.tipology = @tipology
        @house.next_by = @next_by
        @house.furnished = @furnished
        @house.property_type = @property_type
        @house.city_code = @city_code
        @house.province_code = @province_code
        @house.dimention = @dimention
        @house.location = @location
        return @house    
    end
end


h = HouseSearchs.new 
h.title = "Vicente Simão"
h.city_code = 1
puts h.to_house_model