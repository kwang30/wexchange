Rails.application.routes.draw do
  root 'home#home'
  get '/notifications', to: 'notifications#notifications'
  get '/profile', to: 'users#profile'

end
