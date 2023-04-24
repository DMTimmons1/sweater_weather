class SalaryService
  
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.get_salaries(city)
    get_url("/cities/?search=#{city}")
  end
  
private 

  def self.conn
    Faraday.new(url:"https://api.teleport.org/api")
  end
end