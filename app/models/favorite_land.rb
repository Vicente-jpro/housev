class FavoriteLand < ApplicationRecord
  belongs_to :profile
  belongs_to :land
end
