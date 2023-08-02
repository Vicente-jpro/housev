class Dimention < ApplicationRecord
    has_one :land, dependent: :destroy
end
