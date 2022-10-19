require 'rails_helper'

RSpec.describe 'NWSFacade' do
    it 'populates the disaster poro' do
        @disasters = JSON.parse(File.read('spec/fixtures/disaster_data.json'), symbolize_names: true)
        allow(NWSService).to receive(:get_disaster).and_return(@disasters)

        
        location = "29.008056,-81.382778"
        response = NWSFacade.retrieve_disaster(location)
        
        expect(response).to be_a(Array)
        expect(response.first).to be_a(Disaster)
    end

    it 'sad path' do
        @no_disasters = JSON.parse(File.read('spec/fixtures/no_disaster_data.json'), symbolize_names: true)
        allow(NWSService).to receive(:get_disaster).and_return(@no_disasters)

        location = "33.2896,-97.6982"

        response = NWSFacade.retrieve_disaster(location)

        expect(response).to eq([])
    end
end