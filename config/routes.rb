Rails.application.routes.draw do
  resources :sessions
  resources :users
  root 'root#index'
end
