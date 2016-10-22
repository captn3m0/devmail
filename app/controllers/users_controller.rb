# Users Controller
class UsersController < ApplicationController
  def dashboard
    if logged_in?
      @stars = current_user.stars
    end
  end
end
