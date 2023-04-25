class ActivityService
  
  def self.get_activity(activity)
    response = conn.get("activity?type=#{activity}")
    data = JSON.parse(response.body, symbolize_names: true)
  end
  
private 

  def self.conn
    Faraday.new(url:"http://www.boredapi.com/api/") 
  end
end