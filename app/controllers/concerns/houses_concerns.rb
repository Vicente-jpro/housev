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
    

end