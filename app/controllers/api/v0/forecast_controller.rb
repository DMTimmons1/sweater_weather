class Api::V0::ForecastController < ApplicationController
  def index
    begin
      full_forecast = ForecastFacade.new(params[:location]).get_full_forecast
      render json: ForecastSerializer.new(full_forecast)
    rescue
      render json: { error: 'Search requires a location paramater' }, status: 400
    end
  end
end