module PlansSelectedsHelper
    def is_plan_seleted? 
      plan_selected = PlansSelected.find_by_user(current_user)
  
      return plan_selected.id.present?
    end
end
