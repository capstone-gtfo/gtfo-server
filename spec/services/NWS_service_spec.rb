require 'rails_helper'

RSpec.describe NWSService do
    it 'gets weather alerts', :vcr do
        location = "29.008056,-81.382778"
        response = NWSService.get_disaster(location)

        expect(response).to be_a(Hash)
    end
end