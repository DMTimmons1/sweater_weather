class DestinationService
  
  def self.get_location(location)
    response = conn.get("?location=#{location}")
    data = JSON.parse(response.body, symbolize_names: true)
    lat_long = data[:results].first[:locations].first[:latLng]
  end
  
private 

  def self.conn
    Faraday.new(url:"https://www.mapquestapi.com/geocoding/v1/address") do |faraday|
      faraday.headers["key"] = ENV["mapquest_key"]
    end
  end
end