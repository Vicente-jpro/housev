class HomeController < ApplicationController
  around_action :switch_locale

  def index
    @house = House.new
    @house.build_address
    @house.build_location 
    @house.build_dimention
  end

end
