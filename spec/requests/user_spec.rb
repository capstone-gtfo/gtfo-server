require 'rails_helper'

RSpec.describe 'User Requests' do
  describe 'happy path testing' do
    it 'lets you create a user' do
      user_params = {
        lat: '39.7392',
        long: '-104.9903',
        phone_number: '1234567890'
      }

      headers = { content_type: "application/json" }
      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

      user = User.last

      expect(response).to be_successful

      expect(user.latitude).to eq('39.7392')
      expect(user.longitude).to eq('-104.9903')
      expect(user.phone_number).to eq('1234567890')

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
  end
end
