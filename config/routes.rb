Rails.application.routes.draw do
	get '/auth/github/callback', to: 'sessions#create'
	get '/home', to: 'users#dashboard'
  post '/user/stars/refresh', to: 'users#refresh_stars'
end
