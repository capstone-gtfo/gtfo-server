class Api::V1::WeatherController < ApplicationController
    def index
        location = params[:lat]+','+ params[:long]
        data = NWSFacade.retrieve_disaster(location) 
        if data == []
            render json: {data: []}, status: 200
        elsif data == 400
            render json: { error: "Invalid Coordinates: weather retrieval failed" }, status: 400
        else
            render json: NWSSerializer.format_response(data), status: 200
        end
    end
end