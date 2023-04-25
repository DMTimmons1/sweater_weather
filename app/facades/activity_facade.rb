class ActivityFacade
  def initialize(destination)
    @destination = destination
  end

  def get_activities
    forecast = self.get_forecast
    relaxation_activity = ActivityService.get_activity('relaxation')

    if forecast[:temperature].to_i >= 60
      variable_activity = ActivityService.get_activity('recreational')
    elsif forecast[:temperature].to_i >= 50 && forecast[:temperature].to_i <= 60
      variable_activity = ActivityService.get_activity('busywork')
    elsif forecast[:temperature].to_i <= 50
      variable_activity = ActivityService.get_activity('cooking')
    end

    activities = {
      variable_activity[:activity]=> {
        type: variable_activity[:type],
        participants: variable_activity[:participants],
        price: variable_activity[:price]
      },
      relaxation_activity[:activity]=> {
        type: relaxation_activity[:type],
        participants: relaxation_activity[:participants],
        price: relaxation_activity[:price]
      }
    }
  end

  def get_forecast
    coords = DestinationService.get_location(@destination)
    forecast = ForecastService.get_weather(coords[:lat], coords[:lng])

    current_weather = {
      summary: forecast[:current][:condition][:text],
      temperature: "#{forecast[:current][:temp_f]} F"
    }
  end

  def activity_info
    activity_hash = {
      id: "null",
      destination: @destination,
      forecast: self.get_forecast,
      activities: self.get_activities
    }
    Activity.new(activity_hash)
  end
end