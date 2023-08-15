class House < ApplicationRecord
  belongs_to :location
  belongs_to :address
  belongs_to :dimention

  include EnumsConcerns
end
