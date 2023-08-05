class Land < ApplicationRecord
  belongs_to :dimention
  accepts_nested_attributes_for :dimention

  belongs_to :address
  accepts_nested_attributes_for :address

  has_many :profile_lands, dependent: :destroy
  has_many :profiles, through: :profile_lands

  has_many_attached :images

  def self.find_lands_by_user(user)
    Land.joins(:profiles)
        .where("profiles.user_id = #{user.id}")
  end

  # SELECT * FROM lands
  # JOIN profile_lands
  # ON profile_lands.land_id = lands.id;
  # JOIN profiles
  # ON profiles.id = profile_lands.profile_id
  # where profiles.user_id = 1


end

