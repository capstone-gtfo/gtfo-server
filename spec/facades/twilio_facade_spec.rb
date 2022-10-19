require 'rails_helper'

RSpec.describe TwilioFacade do
    it 'populates the disaster poro' do
        disasters = JSON.parse(File.read('spec/fixtures/disasters_2.json'), symbolize_names: true)
        events = [Disaster.new(disasters)]
        phone_number = "+17204740636"
        
        response = TwilioFacade.disaster_sms_response(events, phone_number)

        expect(response).to be_a(Array)
        expect(response.first).to be_a(Disaster)
    end
end 