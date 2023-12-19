class PlansSelected < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  enum duration: { monthly: 30, quarterly: 90, semiannual: 180,  annual: 360 }

  validates :user, uniqueness: {  message: "User can have only one plan selected." }


  scope :find_by_user, ->(user) { where(user_id: user.id) }

  def self.find_plan_selected_by_user(user) 
    PlansSelected.joins(:plan)
                 .joins(:user)
                 .where("plans_selecteds.day_used < plans_selecteds.duration and plans_selecteds.user_id = #{user.id}").take
  end

       
end
