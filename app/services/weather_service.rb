class WeatherService
  
  def self.get_weather(lat, long)
    response = conn.get("?q=#{lat},#{long}")
    data = JSON.parse(response.body, symbolize_names: true)
  end
  
private 

  def self.conn
    Faraday.new(url:"http://api.weatherapi.com/v1/current.json") do |faraday|
      faraday.headers["key"] = ENV["weather_api_key"]
    end
  end
end