class Api::V1::SalariesController < ApplicationController
  def index
    @location = DestinationService.get_location(params[:location])
    require 'pry'; binding.pry
  end
end