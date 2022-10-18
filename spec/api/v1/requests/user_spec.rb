require 'rails_helper'

RSpec.describe 'User Requests' do
  describe 'happy path testing' do
    it 'lets you create a user' do
      user_params = {
        "lat": '39.7392',
        "long": '-104.9903',
        "phone": '1234567890'
      }

      headers = { content_type: "application/json" }
      post "/api/v1/users", headers: headers, params: user_params

      user = User.last

      expect(response).to be_successful

      expect(user.lat).to eq('39.7392')
      expect(user.long).to eq('-104.9903')
      expect(user.phone).to eq('1234567890')

      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response).to have_key(:data)
      expect(user_response[:data].class).to eq(Hash)
      expect(user_response[:data]).to have_key(:id)
      expect(user_response[:data]).to have_key(:type)
      expect(user_response[:data]).to have_key(:attributes)

      attributes = user_response[:data][:attributes]

      expect(attributes).to have_key(:lat)
      expect(attributes).to have_key(:long)
      expect(attributes).to have_key(:phone)
    end

    it 'lets you send a text' do
      user_params = {
        "lat": '39.7392',
        "long": '-104.9903',
        "phone": '18043997020'
      }

      headers = { content_type: "application/json" }
      post "/api/v1/users", headers: headers, params: user_params
    end
  end

  describe 'sad path testing' do
    it 'fails to create a user if info is missing' do
      user_params = {
        "long": '-104.9903',
        "phone": '1234567890'
      }
      headers = { content_type: "application/json" }
      post "/api/v1/users", headers: headers, params: user_params

      user = User.last
      user_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(user_response).to eq({ error: "Latitude is invalid" })
    end

    it 'fails to create a user is phone number length is not 10 or 11 digits' do
      user_params = {
        "lat": '39.7392',
        "long": '-104.9903',
        "phone": '1234234234567890'
      }
      headers = { content_type: "application/json" }
      post "/api/v1/users", headers: headers, params: user_params

      user = User.last
      user_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(user_response).to eq({ error: "Phone number must be 10 characters and all integers" })
    end
  end
end
