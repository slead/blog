Rails.application.routes.draw do

  devise_for :users
  resources :posts
  resources :projects
  resources :presentations
  resources :contacts, only: [:new, :create]

  match '/contact' => "contacts#new", via: [:get, :post], as: :contact 
  
  root 'homepage#index'
end
