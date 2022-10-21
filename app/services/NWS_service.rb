class NwsService
 
    def self.get_disaster(location)
        response = conn.get("/alerts/active") do |faraday|
            faraday.params['point'] = location
            faraday.params['status'] = 'actual'
            faraday.params['urgency'] = 'Immediate,Expected'
            faraday.params['severity'] = 'Extreme,Severe'
            faraday.params['certainty'] = 'Observed,Likely'
        end
        result = JSON.parse(response.body, symbolize_names: true) 
      end

    private  

    def self.conn
        Faraday.new(url: "https://api.weather.gov") 
    end
end