Rails.application.routes.draw do
  root 'posts#index'

  concern :likeable do
    resources :likes, only: [:create, :destroy]
  end

  resources :posts, concerns: :likeable do
    resources :comments, concerns: :likeable, only: [:create, :destroy, :update]
  end

  devise_for :users
  
  namespace :admin do
    root 'dashboard#index'
    resources :posts
  end

end
