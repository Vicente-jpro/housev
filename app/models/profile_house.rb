class ProfileHouse < ApplicationRecord
  belongs_to :profile
  belongs_to :house

  def self.find_by_house(house)
    ProfileHouse.find_by(house_id: house.id)
  end

  def self.is_creator_or_admin_house?(user, house)
    profile = Profile.find_by_user(user)
    profile_house = ProfileHouse.find_by_house(house)
    if profile.empresa? or profile.super_adminstrador?
      return true
    elsif !profile_house.nil?
      return profile.id == profile_house.profile_id
    end 
    return false
  end

  def self.find_houses_by_house(house)
    ProfileHouse
      .select("profiles.*, houses.*, addresses.*, cities.*, provinces.*, profile_houses.*")
      .joins(:profile)
      .joins(:house)
      .joins("JOIN addresses ON addresses.id = houses.address_id JOIN cities ON cities.id = addresses.city_id JOIN provinces ON provinces.id = cities.province_id")
      .where(house_id: house.id)
  end

  # SELECT *
	#  FROM lands
  #    JOIN addresses
  #    ON addresses.id = lands.address_id
  #    JOIN cities 
  #    ON cities.id = addresses.city_id 
  #    JOIN provinces 
  #    ON provinces.id = cities.province_id
  #    JOIN profile_lands
  #    ON profile_lands.house_id = lands.id
  #    JOIN profiles
  #    ON profiles.id = profile_lands.profile_id
  #    JOIN users
  #    ON users.id = profiles.user_id
  #    where users.id = 1;

end

