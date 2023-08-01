class Land < ApplicationRecord
  belongs_to :dimention
  accepts_nested_attributes_for :dimention

  belongs_to :address
  accepts_nested_attributes_for :address

  has_many_attached :photos
end
