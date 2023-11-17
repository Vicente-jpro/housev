class ProfileHouse < ApplicationRecord
  belongs_to :profile
  belongs_to :house

  def self.find_by_house(house)
    ProfileHouse.find_by(house_id: house.id)
  end

  def self.is_creator_or_admin_house?(user, house)
    profile = Profile.find_by_user(user)
    profile_house = ProfileHouse.find_by_house(house)
    if profile.administrador? or profile.super_adminstrador?
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

  # SELECT profiles.*, houses.*, addresses.*, cities.*, provinces.*, profile_houses.*
	# FROM profile_houses
	# join profiles
  #   on profiles.id = profile_houses.profile_id
  #   join houses
  #   on houses.id = profile_houses.house_id
  #   join addresses
  #   on addresses.id = houses.address_id
  #   join cities
  #   on cities.id = addresses.city_id
  #   join provinces
  #   on provinces.id = cities.province_id
  #   where profile_houses.house_id = 2;

end

