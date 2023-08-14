class Land < ApplicationRecord
  belongs_to :dimention
  accepts_nested_attributes_for :dimention

  belongs_to :address
  accepts_nested_attributes_for :address

  has_many :profile_lands, dependent: :destroy
  has_many :profiles, through: :profile_lands
  has_many :favorite_land, dependent: :destroy

  has_many_attached :images
  validates_presence_of :title_land, :description, :price

  def self.find_lands_by_user(user)
    Land.joins(:profiles)
        .where("profiles.user_id = #{user.id}")
        .order(id: :desc)
  end

end

