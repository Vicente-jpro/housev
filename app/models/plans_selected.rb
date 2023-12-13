class PlansSelected < ApplicationRecord
  belongs_to :plans
  belongs_to :user
end
