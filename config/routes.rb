Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "pages#home"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }

  get 'cart', to: 'pages#cart', as: :cart
  get 'add_to_cart/:id', to: 'pages#add_to_cart', as: :add_to_cart
  get 'profile', to: 'pages#profile'
  put 'profile', to: 'pages#update_profile'

  get 'increase_product_quantity', to: 'pages#increase_product_quantity'
  get 'decrease_product_quantity', to: 'pages#decrease_product_quantity'
  get 'delete_cart_product', to: 'pages#delete_cart_product'
  get 'get_sub_total', to: 'pages#get_sub_total'
  get 'transaction_history', to: 'pages#transaction_history'
end
