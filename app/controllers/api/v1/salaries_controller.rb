class Api::V1::SalariesController < ApplicationController
  def index
    if params[:location] == nil
      render json: SalarySerializer.new(Salary.all)
    else
      @location = DestinationService.get_location(params[:location])
      @weather = WeatherService.get_weather(@location[:lat], @location[:lng])
    end
  end
end