Rails.application.routes.draw do

  devise_for :users
  resources :posts
  resources :contacts, only: [:new, :create]

  root 'homepage#index'
end
