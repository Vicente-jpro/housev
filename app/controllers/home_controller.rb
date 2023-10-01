class HomeController < ApplicationController
  around_action :switch_locale

  def index
  end

  def language  
    redirect_to home_index_url 
  end
  
end
