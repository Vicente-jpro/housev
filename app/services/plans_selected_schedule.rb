class PlansSelectedSchedule
    
    def self.update_day_used
        PlansSelected.where("plans_selecteds.id > 0")
                     .update_all(day_used: Arel.sql("plans_selecteds.day_used + 1")) 
    end
    #UPDATE plans_selecteds SET day_used = day_used + 1 WHERE id <> 0
end