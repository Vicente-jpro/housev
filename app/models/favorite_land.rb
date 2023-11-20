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

  # SELECT * FROM favorite_houses
	# JOIN profiles 
  #   ON profiles.id = favorite_houses.profile_id
  #   JOIN houses
  #   ON houses.id = favorite_houses.house_id
  #   where profiles.user_id = 1;

end
