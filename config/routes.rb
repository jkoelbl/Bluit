Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :user_profiles
  resources :text_posts
  root 'root#index'
end
