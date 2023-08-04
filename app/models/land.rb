class Land < ApplicationRecord
  belongs_to :dimention
  accepts_nested_attributes_for :dimention

  belongs_to :address
  accepts_nested_attributes_for :address

  has_many :profile_lands
  has_many :profiles, through: :profile_lands

  has_many_attached :images


  # SELECT * FROM profile_lands 
  # JOIN profiles
  # ON profiles.id = profile_lands.profile_id
  # JOIN lands
  # ON lands.id = profile_lands.land_id
  # WHERE profile_lands.profile_id =  id_profile


  # SELECT * FROM lands  
  # JOIN profile_lands
  # ON profile_lands.id = profile_lands.land_id
  # WHERE profile_lands.profile_id =  id_profile


end

