class HomeController < ApplicationController

  def index
    @house = House.new
    @house.build_address
    @house.build_location 
    @house.build_dimention
  end

end
