class NWSFacade
    def self.retrieve_disaster(location)
        weather_events = NWSService.get_disaster(location)
        if weather_events[:features].empty? == true
            return []
        else
            weather_events[:features].map do |alert|
                Disaster.new(alert)
            end
        end
    end

    def self.retrieve_disaster_sms_signup(location, phone_number)
        weather_events = NWSService.get_disaster(location)
        if weather_events[:features].empty? == false 
            events = weather_events[:features].map do |alert|
                Disaster.new(alert)
            end
            Textable.welcome_disaster_sms_response(events, phone_number)
        end
    end
end