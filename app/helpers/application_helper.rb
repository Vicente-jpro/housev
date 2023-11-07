module ApplicationHelper
   def remove_underscore( sentence )
      underscore = Underscore.new(sentence)
      underscore.to_space
   end

   def switch_locale_name
      ((I18n.locale).to_s == "pt") ? "English": "Português"
   end

   
   def self.human_enum_name(enum_name, enum_value)
     I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
   end
      
end
