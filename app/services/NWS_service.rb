class NWSService
 
    def self.get_disaster(location)
        response = conn.get("/alerts/active?point=#{location}&status=actual") do |faraday|
            #faraday.params['point'] = location
            #faraday.params['status'] = 'actual'
            faraday.params['urgency'] = %w[Immediate Expected]
            faraday.params['severity'] = %w[Extreme Severe]
            faraday.params['certainty'] = %w[Observed Likely]
        end
        result = JSON.parse(response.body, symbolize_names: true) 
      end

    private  

    def self.conn
        Faraday.new(url: "https://api.weather.gov") 
    end
end