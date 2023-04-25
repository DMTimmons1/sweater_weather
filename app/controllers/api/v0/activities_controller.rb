class Api::V0::ActivitiesController < ApplicationController
  def index
    begin
      activities = ActivityFacade.new(params[:destination]).activity_info
      render json: ActivitySerializer.new(activities)
    rescue
      render json: { error: 'Search requires a destination paramater' }, status: 400
    end
  end
end