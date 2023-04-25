require "rails_helper"

RSpec.describe 'Activity request' do
  context 'happy_path' do
    it 'can take a location and return 2 activities based on the current weather' do
      VCR.use_cassette('get_activities_denver') do
        get '/api/v0/activities?destination=denver,co'
        activities = JSON.parse(response.body, symbolize_names: true)
        activities_data = activities[:data][:attributes]
        expect(response).to be_successful
        expect(activities_data).to have_key(:destination)
        expect(activities_data[:destination]).to eq('denver,co')
        expect(activities_data).to have_key(:forecast)
        expect(activities_data[:forecast]).to have_key(:summary)
        expect(activities_data[:forecast]).to have_key(:temperature)
        expect(activities_data).to have_key(:activities)
        expect(activities_data[:activities].count).to eq(2)
        expect(activities_data[:activities].first.last).to have_key(:type)
        expect(activities_data[:activities].first.last).to have_key(:participants)
        expect(activities_data[:activities].first.last).to have_key(:price)
      end
    end
  end

  context 'sad_path' do
    it 'returns an error if there is no location param' do
      VCR.use_cassette('get_activities_sad_path') do
        get '/api/v0/activities'
        message = JSON.parse(response.body, symbolize_names: true)
        expect(message).to have_key(:error)
        expect(message[:error]).to eq("Search requires a destination paramater")
      end
    end
    it 'returns an error if the location param is empty' do
      VCR.use_cassette('get_activities_sad_path_2') do
        get '/api/v0/activities?destination='
        message = JSON.parse(response.body, symbolize_names: true)
        expect(message).to have_key(:error)
        expect(message[:error]).to eq("Search requires a destination paramater")
      end
    end
  end
end