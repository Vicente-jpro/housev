class FavoriteLand < ApplicationRecord
  belongs_to :profile
  belongs_to :land
  validates_presence_of :profile_id, :land_id


  def self.find_all_by_user(user)
    profile = Profile.find_by_user(user)
    favorite_land = FavoriteLand.includes(:land, :profile).where(profile_id: profile.id)
    favorite_land
  end
end
