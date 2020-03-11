Rails.application.routes.draw do
  get 'home/index'
  get '/logout', to: 'users#logout'

  devise_for :users
  resources :comments
  resources :users
  resources :posts

  get '/explore', to: 'posts#index'
  get '/friends', to: 'users#index'

  
  get 'users/:target_id/friend_request', to: 'users#friend_request', as: 'request'
  get '/friendship/:friendship_id', to: 'users#befriend', as: 'frienship'

  get '/notifications', to: 'users#notifications', as: 'notificaion'

  get '/posts/:id/like', to: 'posts#like', as: 'like'
  get '/posts/:id/unlike', to: 'posts#unlike', as: 'unlike'

  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
