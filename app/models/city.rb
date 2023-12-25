class City < ApplicationRecord
  belongs_to :province
  has_many :address
  
  validates_presence_of :province, :city_name

  scope :find_cities, ->(province) { where(province_id: province.id)}
end
