class SessionsController < ApplicationController
  def create
    # numeric id
    existing_user = User.where(userid: omnihash[:uid]).first
    if logged_in?
      flash[:notice] = I18n.t('notifications.provider_already_connected', provider: omnihash[:provider])
    elsif existing_user
      sesion[:user] = existing_user
      flash[:notice] = I18n.t('notifications.logged_in')
    else
      session[:user] = User.create_from_omnihash(omnihash)
      flash[:notice] = I18n.t('notifications.account_created')
    end
    redirect_to '/home'
  end

  def destroy
  end

  def failure
    flash[:error] = I18n.t('notifications.authentication_error')
    redirect_to root_url
  end

  private

  def omnihash
    request.env['omniauth.auth']
  end

  def redirect_path
    :root
  end
end
