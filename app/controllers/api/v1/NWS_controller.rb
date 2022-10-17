class Api::V1::NWSController < ApplicationController
    def index
        results = NWSFacade.retrieve_disaster(location)
    end
end