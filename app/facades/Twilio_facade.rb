class TwilioFacade
    def self.welcome_sms_response(phone_number)
        begin
            client = TwilioService.conn
                        client.messages.create(
                            body: 'Thanks for signing up. You will receive disaster updates for your area when applicable.',
                            from: '+14057844891',
                            to: "+#{phone_number}"
                            )
        rescue Twilio::REST::RestError => e
            return "Can't register for SMS"
            UserMailer.invalid_sms.deliver_now
            # Method to delete that user
        end
    end


    def self.disaster_sms_response(events, phone_number)
        begin
            client = TwilioService.conn
            events.each do |event|
                client.messages.create(
                    body: "#{event.type}: #{event.headline}",
                    from: '+14057844891',
                    to: "+#{phone_number}"
                )
            end
        rescue Twilio::REST::RestError => e
        end
    end
end
