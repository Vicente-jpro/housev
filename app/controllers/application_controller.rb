class ApplicationController < ActionController::Base
    add_flash_types :info, :error
    around_action :switch_locale

    def default_url_options
        { locale: I18n.locale }
    end

    def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    if params[:locale] == "pt"
        locale = "en"
    elsif params[:locale] == "en"
        locale = "pt" 
    end
    
    I18n.with_locale(locale, &action)
    end

    
end
