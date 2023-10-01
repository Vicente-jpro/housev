class ApplicationController < ActionController::Base
    add_flash_types :info
    around_action :switch_locale

    def switch_locale(&action)
    locale = ""
    if params[:locale] == "pt"
        locale = "pt"
    elsif params[:locale] == "en"
        locale = "en"
    elsif locale == ""
        locale = params[:locale] || I18n.default_locale
    end
    debugger
    I18n.with_locale(locale, &action)
    end

    
end
