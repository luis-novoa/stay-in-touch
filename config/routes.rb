Rails.application.routes.draw do

  root 'posts#index'

  put '/friendships/update', to: 'friendships#update'
  delete '/friendships/destroy', to: 'friendships#destroy'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :friendships, only: [:create, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
