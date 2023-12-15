class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :address
  accepts_nested_attributes_for :address, allow_destroy: true

  has_many :profile_lands
  has_many :lands, through: :profile_lands, dependent: :destroy
  has_many :favorite_land, dependent: :destroy

  has_many :profile_houses
  has_many :houses, through: :profile_houses, dependent: :destroy
  has_many :favorite_house, dependent: :destroy

  validates_presence_of :name_profile, :profile_type, :gender
  validates :phone1, :phone2, presence: true, uniqueness: true

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [140, 140]
  end
  
  enum gender: { masculine: "MASCULINE", feminine: "FEMININE" }
  enum profile_type: {
    super_adminstrador: "SUPER_ADMINISTRADOR756", 
    empresa: "EMPRESA", 
    cliente: "CLIENTE"
  }
  
  def self.find_by_user(user) 
    Profile.find_by(user_id: user.id)
  end

  def self.find_by_house(house)
    Profile.joins(:profile_houses)
           .where("profile_houses.house_id = #{house.id}")
           .take
  end
  
end
