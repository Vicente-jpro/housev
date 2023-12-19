class PlansSelectedSchedule
    
    def self.update_day_used
      PlansSelected.where("plans_selecteds.id > 0")
                   .update_all(day_used: Arel.sql("plans_selecteds.day_used + 1")) 
    end

    def self.lock_if_expirated
      PlansSelected.where("plans_selecteds.day_used > plans_selecteds.duration")
                   .update_all(activated: false) 
    end

end