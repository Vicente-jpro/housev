class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [140, 140]
  end

  scope :find_by_user_id, ->(user_id) { where(user_id: user_id) }
  


end
