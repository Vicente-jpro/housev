class House < ApplicationRecord
  include EnumsConcerns

  belongs_to :location
  accepts_nested_attributes_for :location

  belongs_to :dimention
  accepts_nested_attributes_for :dimention

  belongs_to :address
  accepts_nested_attributes_for :address

  has_many_attached :house_images

  validates_presence_of :address, :dimention, :price

  
end
