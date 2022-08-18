Rails.application.routes.draw do
  resources :users
  resources :sessions
  root 'sessions#new'
  get '/logout' => 'sessions#destroy'
end
