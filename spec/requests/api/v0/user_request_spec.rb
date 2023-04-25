require 'rails_helper'

RSpec.describe 'user request' do
  context 'happy path' do
    it 'creates a user with vaild params and provides a created api key' do
      user_hash = {
        email: 'somerrandomemail@provider.com',
        password: 'password123',
        password_confirmation: 'password123'
      }
      VCR.use_cassette('Creating_a_new_user') do 
        expect(User.count).to eq(0)
        post '/api/v0/users', params: user_hash, headers: { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }

        expect(response.status).to eq(201)
        expect(JSON.parse(response.body)["data"]["type"]).to eq("users")
        expect(User.count).to eq(1)
        expect(User.first.api_key).to_not eq(nil)
        expect(JSON.parse(response.body)["data"]["attributes"]["password"]).to eq(nil)
      end
    end
  end
  context 'sad path' do 
    it 'throws an error if any field is left blank' do
      user_hash = {
        email: 'somerrandomemail@provider.com',
        password: '',
        password_confirmation: 'password123'
      }
      VCR.use_cassette('Creating_a_new_user_missing_params') do 
        post '/api/v0/users', params: user_hash, headers: { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }

        expect(response.status).to eq(400)
        expect(JSON.parse(response.body)['errors'].first).to eq("Password can't be blank")
      end
    end
    it 'throws an error if the passwords are not matching' do
      user_hash = {
        email: 'somerrandomemail@provider.com',
        password: 'password',
        password_confirmation: 'password123'
      }
      VCR.use_cassette('Creating_a_new_user_password_mismatch') do 
        post '/api/v0/users', params: user_hash, headers: { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }

        expect(response.status).to eq(400)
        expect(JSON.parse(response.body)['errors'].first).to eq("Password confirmation doesn't match Password")
      end
    end
    it 'throws an error if there is already a user with that email' do
      user_hash = {
        email: 'somerrandomemail@provider.com',
        password: 'password123',
        password_confirmation: 'password123'
      }
      VCR.use_cassette('Creating_a_new_user_while_user_already_exists') do 
        post '/api/v0/users', params: user_hash, headers: { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }

        expect(response.status).to eq(201)
        
        post '/api/v0/users', params: user_hash, headers: { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }

        expect(response.status).to eq(400)
        expect(JSON.parse(response.body)['errors'].first).to eq("Email has already been taken")
      end
    end
  end
end