class Location < ApplicationRecord
    has_many :houses, dependent: :destroy
end
