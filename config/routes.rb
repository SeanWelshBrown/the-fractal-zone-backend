Rails.application.routes.draw do

  resources :users, only: [:create]
  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
  get '/profile', to: 'users#profile'

  resources :fractals, only: [:index, :create, :destroy]

end
