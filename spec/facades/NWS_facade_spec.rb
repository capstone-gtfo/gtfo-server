require 'rails_helper'

RSpec.describe 'NwsFacade' do
    it 'populates the disaster poro' do
        @disasters = JSON.parse(File.read('spec/fixtures/disaster_data.json'), symbolize_names: true)
        allow(NwsService).to receive(:get_disaster).and_return(@disasters)

        
        location = "29.008056,-81.382778"
        response = NwsFacade.retrieve_disaster(location)
        
        expect(response).to be_a(Array)
        expect(response.first).to be_a(Disaster)
    end

    it 'sad path' do
        @no_disasters = JSON.parse(File.read('spec/fixtures/no_disaster_data.json'), symbolize_names: true)
        allow(NwsService).to receive(:get_disaster).and_return(@no_disasters)

        location = "33.2896,-97.6982"

        response = NwsFacade.retrieve_disaster(location)

        expect(response).to eq([])
    end
end