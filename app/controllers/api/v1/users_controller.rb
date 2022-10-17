class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:lat, :long, :phone)
  end
end
