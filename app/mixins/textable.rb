module Textable 
    def self.welcome_sms_response(phone_number)
        client = Twilio::REST::Client.new(ENV['twilio_sid'], ENV['twilio_auth_token'])
        client.messages.create(
            body: 'Thanks for signing up. You will receive disaster updates for your area when applicable.',
            from: '+14057844891',
            to: "+#{phone_number}"
        )
    end 

    def self.disaster_sms_response(events, phone_number)
        client = Twilio::REST::Client.new(ENV['twilio_sid'], ENV['twilio_auth_token'])
        events.each do |event|
            client.messages.create(
                body: "#{event.type}: #{event.headline}",
                from: '+14057844891',
                to: "+#{phone_number}"
            )
        end 
    end 
end 
