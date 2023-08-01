class Land < ApplicationRecord
  belongs_to :dimention
  belongs_to :address
  has_many_attached :photo
end
