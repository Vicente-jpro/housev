class ProfileHouse < ApplicationRecord
  belongs_to :profile
  belongs_to :house

  def self.find_by_house(house)
    ProfileHouse.find_by(house_id: house.id)
  end

  def self.is_creator_house?(user, house)
    profile = Profile.find_by_user(user)
    profile_house = ProfileHouse.find_by_land(house)
    if !profile_house.nil?
      return profile.id == profile_house.profile_id 
    end 
    return false
  end

  def self.find_house_by_house(house)
    ProfileHouse.includes(:profile, :house).find_by(house_id: house.id)
  end

end
