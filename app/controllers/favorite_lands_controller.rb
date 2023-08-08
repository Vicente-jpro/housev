class FavoriteLandsController < ApplicationController
  before_action :authenticate_user!

  def create
    
  end
  
  parameters.permit

end
