class Activity
  attr_accessor :id, :destination, :forecast, :activities

	def initialize(data)
		@id = data[:id]
		@destination = data[:destination]
		@forecast = data[:forecast]
		@activities = data[:activities]
	end
end