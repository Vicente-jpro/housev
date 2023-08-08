class FavoriteLand < ApplicationRecord
  belongs_to :profile
  belongs_to :land
  validate_presence_of :profile_id, :land_id
end
