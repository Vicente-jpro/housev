class HomeController < ApplicationController
  around_action :switch_locale

  def index
  end

  def switch_locale(&action)
  locale = ""
  if params[:locale] == "pt"
      locale = "pt"
  elsif params[:locale] == "en"
      locale = "en"
  elsif locale == ""
      locale = params[:locale] || I18n.default_locale
  end
  I18n.with_locale(locale, &action)
  end

end
