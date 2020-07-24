Rails.application.routes.draw do
  root 'static#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  resources :users 
  resources :workouts
  resources :types 
  resources :comments
end
