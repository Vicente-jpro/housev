class CitiesController < ApplicationController

  def index 
     province = Province.new 
     province.id = params[:province_id]
    # @cities = City.find_cities(province)
    render json: @cities = City.all
      
  end
  
   
end
