Rails.application.routes.draw do

  resources :users, only: [:create]
  post '/login', to: 'users#create'
  get '/profile', to: 'users#profile'

  resources :fractals, only: [:create]

end
