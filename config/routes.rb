Rails.application.routes.draw do
  root 'posts#index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
