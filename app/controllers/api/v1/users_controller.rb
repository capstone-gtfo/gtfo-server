class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    elsif user.errors.messages[:lat].first == "can't be blank"
      render json: { error: "Latitude is invalid" }, status: :unprocessable_entity
    elsif user.errors.messages[:long].first == "can't be blank"
      render json: { error: "Longitude is invalid" }, status: :unprocessable_entity
    else
      render json: { error: "Phone number must be 10 characters and all integers" }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:lat, :long, :phone)
  end
end
