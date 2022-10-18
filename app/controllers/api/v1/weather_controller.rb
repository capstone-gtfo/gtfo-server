class Api::V1::WeatherController < ApplicationController
    def index
        location = params[:lat]+','+ params[:long]
        data = NWSFacade.retrieve_disaster(location)
        render json: NWSSerializer.format_response(data)
    end
end