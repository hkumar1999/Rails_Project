Rails.application.routes.draw do
  root to: 'products#index'

  resources :products
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
