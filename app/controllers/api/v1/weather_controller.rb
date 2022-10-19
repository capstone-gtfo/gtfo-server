class Api::V1::WeatherController < ApplicationController
    def index
        location = params[:lat]+','+ params[:long]
        data = NWSFacade.retrieve_disaster(location)
 
        if data == []
            render json: {data: []}, status: 200
        else
            render json: NWSSerializer.format_response(data), status: 200
        end
    end
end