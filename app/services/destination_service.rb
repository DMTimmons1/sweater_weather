class DestinationService
  
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.get_location(city)
    get_url("/address?location=#{city}")
  end
  
private 

  def self.conn
    Faraday.new(url:"https://www.mapquestapi.com/geocoding/v1") do |faraday|
      faraday.headers["key"] = ENV["mapquest_key"]
    end
  end
end