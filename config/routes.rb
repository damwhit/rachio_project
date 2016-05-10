Rails.application.routes.draw do
  root to: 'home#show'

  get "/user", to: 'users#show'
end
