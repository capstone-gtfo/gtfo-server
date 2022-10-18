class Api::V1::TextsController < ApplicationController
    def index
        SendTextsJob.perform_later 
    end
end