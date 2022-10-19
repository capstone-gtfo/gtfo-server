class NWSFacade
    def self.retrieve_disaster(location)
        weather_events = NWSService.get_disaster(location)
        if weather_events[:status] == 400
            return 400
        elsif weather_events[:features].empty? == true
            return []
        else
            weather_events[:features].map do |alert|
                Disaster.new(alert)
            end
        end
    end
end