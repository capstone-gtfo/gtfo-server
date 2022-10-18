class Api::V1::WeatherController < ApplicationController
    def index
        location = params[:lat]+','+ params[:long]
        results = NWSFacade.retrieve_disaster(location)
        render json: NWSSerializer.format_response(results)
    end
end