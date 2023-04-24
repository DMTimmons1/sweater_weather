class WeatherService
  
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.get_weather(location)
    get_url("/current.json?q=#{location}")
  end
  
private 

  def self.conn
    Faraday.new(url:"http://api.weatherapi.com/v1") do |faraday|
      faraday.headers["key"] = ENV["weather_api_key"]
    end
  end
end