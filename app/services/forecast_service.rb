class ForecastService
  
  def self.get_weather(latitude, longitude)
    response = conn.get("/v1/forecast.json?q=#{latitude},#{longitude}&days=5")
    data = JSON.parse(response.body, symbolize_names: true)
  end
  
private 

  def self.conn
    Faraday.new(url:"http://api.weatherapi.com") do |faraday|
      faraday.headers["key"] = ENV["weather_api_key"]
    end
  end
end