Rails.application.routes.draw do
  get "stripe_payments/create"
  get "orders/new"
  get "orders/create"
  devise_for :customers
  devise_for :users
  root to: 'products#index'
  delete 'cart/remove/:product_id', to: 'cart#remove', as: 'remove_from_cart'
  get "orders/:id/invoice", to: "orders#invoice", as: "invoice"
  get '/profile', to: 'users#edit', as: :edit_profile
  patch '/profile', to: 'users#update'
  get 'provinces/:id/taxes', to: 'provinces#taxes'
  post "/create-checkout-session", to: "stripe_payments#create", as: "create_checkout_session"
  get "/checkout/success", to: "stripe_payments#success", as: "checkout_success"

  # Explicitly keep products#index for searching
  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :create,:show]
  resource :profile, only: [:edit, :update], controller: 'users'
  resources :provinces, only: [] do
  get 'taxes', on: :member
end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
