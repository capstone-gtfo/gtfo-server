require 'rails_helper'

RSpec.describe NWSFacade do
    it 'populates the disaster poro', :vcr do
        location = "29.008056,-81.382778"
        response = NWSFacade.retrieve_disaster(location)
        
        expect(response).to be_a(Array)
        expect(response.first).to be_a(Disaster)
    end

    it 'sad path', :vcr do
        location = "33.2896,-97.6982"

        response = NWSFacade.retrieve_disaster(location)

        expect(response).to eq([])
    end
end