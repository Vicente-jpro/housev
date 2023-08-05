class ProfileLand < ApplicationRecord
  belongs_to :profile
  belongs_to :land

  def self.find_by_land(land)
    ProfileLand.find_by(land_id: land.id)
  end

  def self.is_creator_land?(user, land)
    profile = Profile.find_by_user(user)
    profile_land = ProfileLand.find_by_land(land)
    if !profile_land.nil?
      return profile.id == profile_land.profile_id 
    end 
    return false
  end

end
