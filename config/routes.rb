Rails.application.routes.draw do
  root to: 'home#show'

  get "/user", to: 'users#show'

  get "/device", to: 'devices#show'
end
