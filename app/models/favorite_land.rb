class FavoriteLand < ApplicationRecord
  belongs_to :profile
  belongs_to :land
  validates_presence_of :profile_id, :land_id
  


  def self.find_all_by_user(user)
    FavoriteLand.joins(:land)
                .joins(:profile)
                .where("profiles.user_id = #{user.id}")
  end

  def self.find_by_land(profile_land)
    FavoriteLand.includes(:land, :profile).find_by(land_id: profile_land.land_id)
  end

  def self.exist?(profile_land)
    profile_land = FavoriteLand.find_by_land(profile_land)
    profile_land.nil?
  end

end
