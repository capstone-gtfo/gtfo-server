require 'rails_helper'

RSpec.describe TwilioService do
    it 'sends text messages' do
        response = TwilioService.conn

        expect(response.class).to eq(Twilio::REST::Client)
    end
end