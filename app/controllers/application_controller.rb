# App Controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user

  helper :all

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session.key?(:user_id)
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end

  def current_user?
    !!current_user
  end

  def logged_in?
    current_user?
  end

  def authenticate_user!
    if session.key?(:user_id)
      current_user
    else
      redirect_to redirect_path
    end
  end

  def logout!
    @current_user = nil
    reset_session
  end

  def redirect_path
    :root
  end
end
