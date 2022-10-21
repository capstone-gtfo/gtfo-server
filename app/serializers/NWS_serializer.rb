class NwsSerializer

   def self.format_response(weather) 
    {
        data:  weather.map do |x| 
        {
            id: nil,   
            type: "disaster",
            attributes: {
                areas: x.areas,
                coordinates: x.coordinates,
                type: x.type,
                certainty: x.certainty,
                severity: x.severity,
                urgency: x.urgency,
                headline: x.headline,
                description: x.description
            }
        } 
        end
   }
    end
end