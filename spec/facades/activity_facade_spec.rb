require 'rails_helper'

RSpec.describe ActivityFacade do
  it "returns a formatted forcast" do
    VCR.use_cassette('activity_facade_denver_forecast') do
      forecast = ActivityFacade.new('denver,co').get_forecast
      expect(forecast).to be_a(Hash)
      expect(forecast).to have_key(:summary)
      expect(forecast).to have_key(:temperature)
    end
  end
  it "returns activities based on the temperature" do
    VCR.use_cassette('activity_facade_denver_activites') do
      activities = ActivityFacade.new('denver,co').get_activities
      expect(activities.count).to eq(2)
      expect(activities.first.last).to have_key(:type)
      expect(activities.first.last).to have_key(:participants)
      expect(activities.first.last).to have_key(:price)
    end
  end
end