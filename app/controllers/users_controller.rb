# Users Controller
class UsersController < ApplicationController
  def dashboard
    @stars = []
    if logged_in?
      @stars = current_user.stars
      # byebug
    end
  end
end
