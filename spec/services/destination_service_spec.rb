require 'rails_helper'

RSpec.describe DestinationService do
  context 'happy_path' do 
    it 'returns the longitute and lattitude of a given location' do
      VCR.use_cassette('denver_coordinate_grab') do
        coords = DestinationService.get_location('denver,co')
        expect(coords).to be_a(Hash)
        expect(coords).to have_key(:lat)
        expect(coords[:lat]).to be_a(Float)
        expect(coords[:lat]).to eq(39.74001)
        expect(coords).to have_key(:lng)
        expect(coords[:lng]).to be_a(Float)
        expect(coords[:lng]).to eq(-104.99202)
      end
    end
  end
end