require 'rails_helper'

RSpec.describe 'disaster request' do
    xit 'gets response with disaster information', :vcr do
        get '/api/v1/disasters?lat=29.008056&long=-81.382778'
        
        expect(response).to be_successful
        expect(response.status).to eq(200)

        forecast = JSON.parse(response.body, symbolize_names: true)
        
        expect(forecast).to be_a Hash
        
        expect(forecast[:data].first[:id]).to eq(nil)
        expect(forecast[:data].first[:type]).to eq("disaster")
        expect(forecast[:data].first[:attributes]).to have_key(:areas)
        expect(forecast[:data].first[:attributes]).to have_key(:coordinates)
        expect(forecast[:data].first[:attributes]).to have_key(:type)
        expect(forecast[:data].first[:attributes]).to have_key(:certainty)
        expect(forecast[:data].first[:attributes]).to have_key(:severity)
        expect(forecast[:data].first[:attributes]).to have_key(:urgency)
        expect(forecast[:data].first[:attributes]).to have_key(:headline)
        expect(forecast[:data].first[:attributes]).to have_key(:description)
    end

    xit 'no disaster path', :vcr do
        get '/api/v1/disasters?lat=33.2896&long=-97.6982'

        expect(response).to be_successful
        expect(response.status).to eq(200)
        
        forecast = JSON.parse(response.body, symbolize_names: true)
        
        expect(forecast.count).to eq(1)
         
        expect(forecast).to be_a Hash
        expect(forecast[:data]).to eq([])
    end

    it 'sad path - bad coordinates', :vcr do
        get '/api/v1/disasters?lat=33.2896&long=33.2896'

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        
        forecast = JSON.parse(response.body, symbolize_names: true)
        
        expect(forecast.count).to eq(1)
        
        expect(forecast).to be_a Hash
        expect(forecast[:error]).to eq("Invalid Coordinates: weather retrieval failed")
    end

    it 'sad path - invalid coordinates', :vcr do
        get '/api/v1/disasters?lat=sfv&long=sdfs'

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        
        forecast = JSON.parse(response.body, symbolize_names: true)
        
        expect(forecast.count).to eq(1)
        
        expect(forecast).to be_a Hash
        expect(forecast[:error]).to eq("Invalid Coordinates: weather retrieval failed")
    end
end