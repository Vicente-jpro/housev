class PlansSelected < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  enum duration: { monthly: 30, quarterly: 90, semiannual: 180,  annual: 360 }

  validates :user, uniqueness: {  message: "User can have only one plan selected." }


  scope :find_by_user, ->(user) { where(user_id: user.id).take }

       
end
