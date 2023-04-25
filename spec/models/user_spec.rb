require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'model methods' do
    describe 'create_api_key' do 
      it 'can create an api key for a user' do
        user = User.create!(email: 'somerandomemail@provider.com', password: 'password123', password_confirmation: 'password123')
        expect(user.api_key).to_not eq(nil)
      end
    end
  end
end
