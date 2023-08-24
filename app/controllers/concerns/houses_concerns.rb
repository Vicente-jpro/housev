module HousesConcerns
    extend ActiveSupport::Concern

    def is_land_creator?(user)
      house = House.find_houses_by_user(user)
      !house.nil?
    end

end