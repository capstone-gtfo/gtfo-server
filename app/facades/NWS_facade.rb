class NWSFacade
    def self.retrieve_disaster(location)
      weather_event = NWSService.get_disaster(location)
        weather_event.map do |alert|
            Disaster.new(alert)
        end
    end
end