Rails.application.routes.draw do
  get 'home/index'
  get '/logout', to: 'users#logout'
  devise_for :users
  resources :comments
  resources :posts
  resources :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
