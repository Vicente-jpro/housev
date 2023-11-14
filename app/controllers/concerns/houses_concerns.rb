module HousesConcerns
    extend ActiveSupport::Concern

    def is_house_creator?(user)
      house = House.find_houses_by_user(user)
      return !house.empty?
    end

    def is_house_creator?(user, house)
      house = House.find_house_by_user(user, house)
      return !house.empty?
    end
    
    def to_house_model(house)
      house = House.new
      house.room = @room
      house.title = @title
      house.living_room = @living_room
      house.bath_room = @bath_room
      house.yard = @yard
      house.kitchen = @kitchen
      house.balcony = @balcony
      house.condition = @condition
      house.type_negotiation = @type_negotiation
      house.price = @price
      house.garage = @garage
      house.pool = @pool
      house.description = @description
      house.tipology = @tipology
      house.next_by = @next_by
      house.furnished = @furnished
      house.property_type = @property_type
      house.city_code = @city_code
      house.province_code = @province_code
      house.dimention = @dimention
      house.location = @location
      return house    
  end
  
end