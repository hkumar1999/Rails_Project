Rails.application.routes.draw do
  root to: 'products#index'
  delete 'cart/remove/:product_id', to: 'cart#remove', as: 'remove_from_cart'

  # Explicitly keep products#index for searching
  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
