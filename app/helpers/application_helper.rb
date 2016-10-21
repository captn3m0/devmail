module ApplicationHelper
	def user_signed_in?
    !session[:user].nil?
	end

  def current_user
    session[:user]
  end

  def signin_path(provider)
    "/auth/#{provider.to_s}"
  end
end
