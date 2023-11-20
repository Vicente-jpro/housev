class FavoriteHouse < ApplicationRecord
  belongs_to :profile
  belongs_to :house

  def self.find_all_by_user(user)
    FavoriteHouse.joins(:house)
                .joins(:profile)
                .where("profiles.user_id = #{user.id}")
  end
end
