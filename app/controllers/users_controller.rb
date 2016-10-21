# Users Controller
class UsersController < ApplicationController
  def dashboard
    return render json: current_user if logged_in?
  end
end
