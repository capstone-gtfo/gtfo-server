require 'rails_helper'

RSpec.describe 'disaster request' do
    it 'gets response with disaster information', :vcr do
        get '/api/v1/disasters?lat=29.008056&long=-81.382778'
        
        expect(response).to be_successful

        forecast = JSON.parse(response.body, symbolize_names: true)[:data]
         
        expect(forecast).to be_a Hash

        expect(forecast[:id]).to eq(nil)
        expect(forecast[:type]).to eq("forecast")
        expect(forecast[:attributes]).to have_key(:current_weather)
        expect(forecast[:attributes]).to have_key(:daily_weather)
        expect(forecast[:attributes]).to have_key(:hourly_weather)

        expect(forecast[:attributes][:daily_weather].count).to eq(5)
        expect(forecast[:attributes][:daily_weather]).to be_a Array

        expect(forecast[:attributes][:hourly_weather].count).to eq(8)
        expect(forecast[:attributes][:hourly_weather]).to be_a Array
    end
end