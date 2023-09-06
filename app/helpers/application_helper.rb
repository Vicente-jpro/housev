module ApplicationHelper
   def remove_underscore( sentence )
      underscore = Underscore.new(sentence)
      underscore.to_space
   end
end
