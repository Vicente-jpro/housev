class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :address
  accepts_nested_attributes_for :address

  has_many :profile_lands
  has_many :lands, through: :profile_lands, dependent: :destroy

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [140, 140]
  end
  
  enum gender: { Masculino: "MASCULINE", Feminino: "FEMININE" }
  enum profile_type: {
    Super_administrador: "SUPER_ADMINISTRADOR", 
    Adiministrador: "ADMINISTRADOR", 
    cliente: "CLIENTE"
  }
  
end
