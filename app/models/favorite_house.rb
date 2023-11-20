class FavoriteHouse < ApplicationRecord
  belongs_to :profile
  belongs_to :house

  def self.find_all_by_user(user)
    FavoriteHouse.joins(:house)
                .joins(:profile)
                .where("profiles.user_id = #{user.id}")
  end

  def self.exist?(favorite_house)
    profile_house = FavoriteHouse.find(favorite_house.house_id)
    profile_house.nil?
  end


  def self.find_by_house(profile_house)
    FavoriteHouse.includes(:house, :profile).find_by(house_id: profile_house.house_id)
  end

  def self.exist?(profile_house)
    profile_house = FavoriteHouse.find_by_house(profile_house)
    profile_house.nil?
  end

end
