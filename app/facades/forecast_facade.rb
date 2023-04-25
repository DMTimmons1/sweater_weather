class ForecastFacade
  def initialize(destination)
    @destination = destination
  end

  def get_full_forecast
    coords = DestinationService.get_location(@destination)
    forecast = ForecastService.get_weather(coords[:lat], coords[:lng])
  end
end