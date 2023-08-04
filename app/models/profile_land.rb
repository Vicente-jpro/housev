class ProfileLand < ApplicationRecord
  belongs_to :profile
  belongs_to :land

  def self.find_all_lands_by_user(user)
    ProfileLand.joins(:profile, :land)
    .where("profiles.user_id = #{user.id}")
  end

end
