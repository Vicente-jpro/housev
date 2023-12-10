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

  def self.find_favorite_by_user_and_house(user, house)
    FavoriteHouse.joins("JOIN houses ON houses.id = favorite_houses.house_id")
        .joins("JOIN houses ON houses.id = favorite_houses.house_id") 
        .joins("JOIN profiles ON profiles.id = favorite_houses.profile_id")
        .joins("JOIN users ON users.id = profiles.user_id")
        .where("users.id = #{user.id} and houses.id = #{house.id}")
        .order(id: :desc).take
  end

end
