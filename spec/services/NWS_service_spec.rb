require 'rails_helper'

RSpec.describe 'NWSService' do
    it 'gets weather alerts' do
        @disasters = JSON.parse(File.read('spec/fixtures/disaster_data.json'), symbolize_names: true)
        allow(NWSService).to receive(:get_disaster).and_return(@disasters)

        location = "29.008056,-81.382778"
        response = NWSService.get_disaster(location)
        
        expect(response).to be_a(Hash)
    end
end