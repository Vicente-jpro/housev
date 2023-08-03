class Address < ApplicationRecord
  belongs_to :city
  has_one :profile, dependent: :destroy
  has_one :land, dependent: :destroy
end
