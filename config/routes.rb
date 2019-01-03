Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :user_profiles
  root 'root#index'
end
