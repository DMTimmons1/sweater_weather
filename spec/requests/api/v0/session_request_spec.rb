require 'rails_helper'

RSpec.describe 'Sessions Request' do
  before do
    user_hash = {
      email: 'somerrandomemail@provider.com',
      password: 'password123',
      password_confirmation: 'password123'
    }
    post '/api/v0/users', params: user_hash, headers: { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response.status).to eq(201)
  end
  context 'happy path' do
    it 'creates a session when a user has valid credentials' do
      user_login_hash = {
        email: 'somerrandomemail@provider.com',
        password: 'password123'
      }
      post '/api/v0/sessions', params: user_login_hash, headers: { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }
      
      expect(response.status).to eq(200)
    end
  end
  context 'sad path' do
    it 'throws an error if the email is invalid' do
      user_login_hash = {
        email: 'someotherrandomemail@provider.com',
        password: 'password123'
      }
      post '/api/v0/sessions', params: user_login_hash, headers: { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }
      
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)['errors']).to eq("Your credentials are invalid")
    end
    it 'throws an error if the password is invalid' do
      user_login_hash = {
        email: 'somerrandomemail@provider.com',
        password: 'wrongpassword'
      }
      post '/api/v0/sessions', params: user_login_hash, headers: { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }
      
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)['errors']).to eq("Your credentials are invalid")
    end
  end
end