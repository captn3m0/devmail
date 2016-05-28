class UsersController < ApplicationController
  def dashboard
    render json: current_user if logged_in?
    'Not logged in'
  end
end
