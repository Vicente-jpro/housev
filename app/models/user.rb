class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :profile, dependent: :destroy
  JOIN_CITIES_AND_PROVINCES = "JOIN cities ON cities.id = addresses.city_id JOIN provinces ON provinces.id = cities.province_id"
 
  has_one :user

  def self.find_user_by_house(house)
    User.joins(:profile)
        .joins("join profile_houses on profile_houses.profile_id = profiles.id")
        .where("profile_houses.house_id = #{house.id}")
        .take
  end

  def self.find_user_by_land(land)
    User.joins(:profile)
        .joins("join profile_lands on profile_lands.profile_id = profiles.id")
        .where("profile_lands.land_id = #{land.id}")
        .take
  end
  
end