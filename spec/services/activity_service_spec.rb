require 'rails_helper'

RSpec.describe ActivityService do
  context 'happy_path' do 
    it 'returns an activity given the type' do
      VCR.use_cassette('type_activity_grab') do
        activity = ActivityService.get_activity('recreational')
        expect(activity).to be_a(Hash)
        expect(activity).to have_key(:activity)
        expect(activity).to have_key(:type)
        expect(activity).to have_key(:participants)
        expect(activity).to have_key(:price)
      end
    end
  end
end