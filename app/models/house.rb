class House < ApplicationRecord
  include EnumsConcerns

  belongs_to :location
  accepts_nested_attributes_for :location

  belongs_to :dimention
  accepts_nested_attributes_for :dimention

  belongs_to :address
  accepts_nested_attributes_for :address

  has_many_attached :house_images
  
  has_many :profile_houses, dependent: :destroy
  has_many :profiles, through: :profile_houses
  has_many :favorite_houses, dependent: :destroy

  validates_presence_of :address, :dimention, :price, :title, :description, :house_images

  def self.find_houses_by_user(user)
    House.joins(:profiles)
        .where("profiles.user_id = #{user.id}")
        .order(id: :desc)
  end
  
  def self.find_house_by_user(user, house)
    Land.joins(:profiles)
        .where("profiles.user_id = #{user.id} and houses.id = #{house.id}")
        .order(id: :desc)
  end

end
