require 'rails_helper'

RSpec.describe ForecastFacade do
  it "takes in a city and state and returns the weather for that city" do
    VCR.use_cassette('forecast_facade_denver') do
      forecast = ForecastFacade.new("denver,co").get_full_forecast
      expect(forecast).to be_a(Hash)
      expect(forecast).to have_key(:location)
      expect(forecast[:location]).to have_key(:name)
      expect(forecast[:location][:name]).to eq("Denver")
      expect(forecast[:location]).to have_key(:region)
      expect(forecast[:location][:region]).to eq("Colorado")
      expect(forecast[:location]).to have_key(:country)
      expect(forecast[:location][:country]).to eq("United States of America")
      expect(forecast[:location]).to have_key(:lat)
      expect(forecast[:location][:lat]).to eq(39.74)
      expect(forecast[:location]).to have_key(:lon)
      expect(forecast[:location][:lon]).to eq(-104.99)
      expect(forecast).to have_key(:current)
      expect(forecast[:forecast]).to have_key(:forecastday)
      expect(forecast[:forecast][:forecastday]).to be_an(Array)
      expect(forecast[:forecast][:forecastday].count).to eq(5)
      expect(forecast[:forecast][:forecastday].first).to have_key(:day)
      expect(forecast[:forecast][:forecastday].first).to have_key(:hour)
    end
  end
end