class Disaster
    attr_reader :urgency, :severity, :certainty, :type, :headline, :description, :areas, :coordinates, :id

    def initialize(data)
        @urgency = data[:properties][:urgency] 
        @severity = data[:properties][:severity]
        @certainty = data[:properties][:certainty]
        @type = data[:properties][:event]
        @headline = data[:properties][:headline]
        @description = data[:properties][:description]
        @areas = data[:properties][:areaDesc]
        @coordinates = data[:geometry][:coordinates].first
    end
end