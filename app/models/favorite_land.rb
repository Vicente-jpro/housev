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

  def self.find_favorite_by_user_and_land(user, land)
    FavoriteLand.joins("JOIN lands ON lands.id = favorite_lands.land_id")
        .joins("JOIN lands ON lands.id = favorite_lands.land_id") 
        .joins("JOIN profiles ON profiles.id = favorite_lands.profile_id")
        .joins("JOIN users ON users.id = profiles.user_id")
        .where("users.id = #{user.id} and lands.id = #{land.id}")
        .order(id: :desc).take
  end

end
