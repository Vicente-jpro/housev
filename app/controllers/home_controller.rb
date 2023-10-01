class HomeController < ApplicationController
  around_action :switch_locale

  def index
  end

end
