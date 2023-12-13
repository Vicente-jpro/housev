class PlansSelected < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  enum duration: { monthly: 30, quarterly: 90, semiannual: 180,  annual: 360 }
       
end
