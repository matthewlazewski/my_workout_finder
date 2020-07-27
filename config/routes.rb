Rails.application.routes.draw do
  root 'static#home'

  get '/auth/facebook/callback' => 'sessions#omniauth'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'

  resources :users 
  resources :workouts
  resources :categories do 
     resources :workouts,only: [:new, :create, :index]
  end 
  resources :comments
end
