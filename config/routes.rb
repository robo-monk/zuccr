Rails.application.routes.draw do
  get 'home/index'
  get '/logout', to: 'users#logout'

  devise_for :users
  resources :comments
  resources :users
  resources :posts
  
  get '/posts/:id/like', to: 'posts#like', as: 'like'
  get '/posts/:id/unlike', to: 'posts#unlike', as: 'unlike'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
