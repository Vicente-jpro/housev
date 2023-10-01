module ApplicationHelper
   def remove_underscore( sentence )
      underscore = Underscore.new(sentence)
      underscore.to_space
   end

   def switch_locale_name
      ((I18n.locale).to_s == "pt") ? "English": "Português"
   end
end
