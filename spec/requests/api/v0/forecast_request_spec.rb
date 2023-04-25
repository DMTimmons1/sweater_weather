require "rails_helper"

RSpec.describe 'Forecast request' do
  context 'happy_path' do
    it 'can take a location and return the current forecast, daily forecast, and hourly forecast' do
      VCR.use_cassette('get_forecast_denver') do
        get '/api/v0/forecast?location=denver,co'
        forecast = JSON.parse(response.body, symbolize_names: true)
        forecast_data = forecast[:data][:attributes]
        expect(response).to be_successful

        expect(forecast_data).to have_key(:current_weather)
        expect(forecast_data[:current_weather]).to have_key(:last_updated)
        expect(forecast_data[:current_weather]).to have_key(:temperature)
        expect(forecast_data[:current_weather]).to have_key(:feels_like)
        expect(forecast_data[:current_weather]).to have_key(:humidity)
        expect(forecast_data[:current_weather]).to have_key(:uvi)
        expect(forecast_data[:current_weather]).to have_key(:visibility)
        expect(forecast_data[:current_weather]).to have_key(:conditions)
        expect(forecast_data[:current_weather]).to have_key(:icon)

        expect(forecast_data).to have_key(:daily_weather)
        expect(forecast_data[:daily_weather].count).to eq(5)
        expect(forecast_data[:daily_weather].first).to have_key(:date)
        expect(forecast_data[:daily_weather].first).to have_key(:sunrise)
        expect(forecast_data[:daily_weather].first).to have_key(:sunset)
        expect(forecast_data[:daily_weather].first).to have_key(:max_temp)
        expect(forecast_data[:daily_weather].first).to have_key(:min_temp)
        expect(forecast_data[:daily_weather].first).to have_key(:condition)
        expect(forecast_data[:daily_weather].first).to have_key(:icon)
        
        
        expect(forecast_data).to have_key(:hourly_weather)
        expect(forecast_data[:hourly_weather].count).to eq(24)
        expect(forecast_data[:hourly_weather].first).to have_key(:time)
        expect(forecast_data[:hourly_weather].first).to have_key(:temperature)
        expect(forecast_data[:hourly_weather].first).to have_key(:conditions)
        expect(forecast_data[:hourly_weather].first).to have_key(:icon)
      end
    end
  end

  context 'sad_path' do
    it 'returns an error if there is no location param' do
      VCR.use_cassette('get_forecast_sad_path') do
        get '/api/v0/forecast'
        message = JSON.parse(response.body, symbolize_names: true)
        expect(message).to have_key(:error)
        expect(message[:error]).to eq("Search requires a location paramater")
      end
    end
    it 'returns an error if the location param is empty' do
      VCR.use_cassette('get_forecast_sad_path_2') do
        get '/api/v0/forecast?location='
        message = JSON.parse(response.body, symbolize_names: true)
        expect(message).to have_key(:error)
        expect(message[:error]).to eq("Search requires a location paramater")
      end
    end
  end
end