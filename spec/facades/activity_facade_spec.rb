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
  it "returns the destination, forecast, and activities all in one hash" do
    VCR.use_cassette('activity_facade_denver_activity_info') do
      activities = ActivityFacade.new('denver,co').activity_info
      expect(activities.id).to eq("null")
      expect(activities.activities.count).to eq(2)
      expect(activities.activities.first.last).to have_key(:type)
      expect(activities.activities.first.last).to have_key(:participants)
      expect(activities.activities.first.last).to have_key(:price)
      expect(activities.destination).to eq('denver,co')
      expect(activities.forecast).to have_key(:summary)
      expect(activities.forecast).to have_key(:temperature)
    end
  end
end