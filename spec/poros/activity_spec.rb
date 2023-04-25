require 'rails_helper'

RSpec.describe Activity do
  describe '#initialize' do
    let(:activity_info) do
      {:id=>"null",
        :destination=>"chicago,il",
        :forecast=>
        {:summary=>"Partly cloudy", :temperature=>"44.1 F"},
        :activities=>
        {"Create a cookbook with your favorite recipes"=>
          {:type=>"cooking", :participants=>1, :price=>0}, 
          "Take a caffeine nap"=>
          {:type=>"relaxation", :participants=>1, :price=>0.1}
        }
      }
    end

    it 'creates an activity object' do
      activity = Activity.new(activity_info)
      expect(activity).to be_a(Activity)
      expect(activity.id).to eq("null")
      expect(activity.destination).to eq("chicago,il")
      expect(activity.forecast).to be_a(Hash)
      expect(activity.forecast[:summary]).to eq("Partly cloudy")
      expect(activity.forecast[:temperature]).to eq("44.1 F")
      expect(activity.activities).to be_a(Hash)
      expect(activity.activities.count).to eq(2)
      expect(activity.activities.first).to be_an(Array)
      expect(activity.activities.first.first).to eq("Create a cookbook with your favorite recipes")
      expect(activity.activities.first.last[:type]).to eq("cooking")
      expect(activity.activities.first.last[:participants]).to eq(1)
      expect(activity.activities.first.last[:price]).to eq(0)
    end
  end
end