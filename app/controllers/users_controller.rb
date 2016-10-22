# Users Controller
class UsersController < ApplicationController
  def dashboard
    @stars = []
    if logged_in?
      @stars = current_user.stars
      # byebug
    end
  end

  def refresh_stars
    if logged_in?
      FetchStarsJob.perform_later current_user
    end
  end
end
