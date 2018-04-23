Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#homepage'
  get "/auth/:provider/callback", to: "sessions#login", as: "auth_callback"

  resources :products, only: [:index, :show] do
    resources :reviews, only: [:index, :show, :new, :create]
  end
  resources :merchants
  resources :orders
  resources :categories, only: [:index, :show]
  resources :carts
  resources :cartitems
  resources :reviews, only: [:index, :show, :new, :create]


end
