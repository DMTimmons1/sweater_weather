class ActivityFacade
  def get_relaxation_activity
    relaxation_activity = ActivityService.get_activity('relaxation')
  end

  def get_variable_activity(type)
    variable_activity = ActivityService.get_activity("#{type}")
  end
end