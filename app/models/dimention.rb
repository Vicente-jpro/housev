class Dimention < ApplicationRecord
    has_one :land, dependent: :destroy
    validates :width_d, comparison: { greater_than: 5 }
    validates :height_d, comparison: { greater_than: 5 }
end
