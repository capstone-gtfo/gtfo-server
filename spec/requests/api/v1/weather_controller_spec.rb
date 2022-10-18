require 'rails_helper'

RSpec.describe 'disaster request' do
    it 'gets response with disaster information', :vcr do
        get '/api/v1/disasters?lat=29.008056&long=-81.382778'
        
        expect(response).to be_successful

        forecast = JSON.parse(response.body, symbolize_names: true)
        
        expect(forecast).to be_a Hash
        
        expect(forecast[:data].first[:id]).to eq(nil)
        expect(forecast[:data].first[:type]).to eq("Flood Warning")
        expect(forecast[:data].first[:attributes]).to have_key(:areas)
        expect(forecast[:data].first[:attributes]).to have_key(:coordinates)
        expect(forecast[:data].first[:attributes]).to have_key(:type)
        expect(forecast[:data].first[:attributes]).to have_key(:certainty)
        expect(forecast[:data].first[:attributes]).to have_key(:severity)
        expect(forecast[:data].first[:attributes]).to have_key(:urgency)
        expect(forecast[:data].first[:attributes]).to have_key(:headline)
        expect(forecast[:data].first[:attributes]).to have_key(:description)
    end
end