Rails.application.routes.draw do

  devise_for :users
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]

  match '/contact' => "contacts#new", via: [:get, :post]
  
  root 'homepage#index'
end
