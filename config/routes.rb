Rails.application.routes.draw do
  root 'posts#index'

  concern :likeable do
    resources :likes, only: [:create, :destroy]
  end

  resources :posts, concerns: :likeable do
    resources :comments, concerns: :likeable
  end

  devise_for :users

end
