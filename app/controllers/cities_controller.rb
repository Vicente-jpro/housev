class CitiesController < ApplicationController

  def province 
     province = Province.new 
     province.id = params[:id]
     @cities = City.find_cities(province)
    render json: @cities
      
  end
  
   
end
