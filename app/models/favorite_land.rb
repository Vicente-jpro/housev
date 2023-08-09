class FavoriteLand < ApplicationRecord
  belongs_to :profile
  belongs_to :land
  validates_presence_of :profile_id, :land_id
  


  def self.find_all_by_user(user)
    profile = Profile.find_by_user(user)
    favorite_land = FavoriteLand.includes(:land, :profile).where(profile_id: profile.id)
    favorite_land
  end

  def self.find_by_land(profile_land)
    FavoriteLand.includes(:land, :profile).find_by(land_id: profile_land.land_id)
  end

  def self.exist?(profile_land)
    profile_land = FavoriteLand.find_by_land(profile_land)
    profile_land.nil?
  end

end
