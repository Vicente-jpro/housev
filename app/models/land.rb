class Land < ApplicationRecord
  belongs_to :dimention
  accepts_nested_attributes_for :dimention

  belongs_to :address
  accepts_nested_attributes_for :address

  has_many :profile_lands
  has_many :profiles, through: :profile_lands

  has_many_attached :images
end
