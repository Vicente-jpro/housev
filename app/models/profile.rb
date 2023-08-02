class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :address
  accepts_nested_attributes_for :address

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [140, 140]
  end

  enum profile_type: {Adiministrador: "ADMINISTRADOR", cliente: "CLIENTE"}
  scope :find_by_user_id, ->(user_id) { where(user_id: user_id) }
  
end
