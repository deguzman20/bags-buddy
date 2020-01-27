Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  root to: "pages#home"
  # Cart Routes

  get "contact", to: "contact_us#contact"
<<<<<<< Updated upstream
  get "add_contact", to: "contact_us#add_contact"
  
  get "wishlist", to: 'wishlist#index'
=======

  get "wishlist", to: "wishlist#index"
>>>>>>> Stashed changes
  get "add_to_wishlist", to: "wishlist#add_to_wishlist"
  get "remove_item_from_wishlist", to: "wishlist#remove_item_from_wishlist"
  get "wishlist_add_to_cart", to: "wishlist#wishlist_add_to_cart"

  get "cart", to: "carts#cart", as: :cart
  get "single_product_add_to_cart", to: "carts#single_product_add_to_cart"
  get "add_to_cart/:id", to: "carts#add_to_cart", as: :add_to_cart
  get "remove_cart_product", to: "carts#remove_cart_product"
  get "increase_product_quantity", to: "carts#increase_product_quantity"
  get "decrease_product_quantity", to: "carts#decrease_product_quantity"
  get "non_on_hand_add_to_cart", to: "carts#non_on_hand_add_to_cart"
  get "delete_cart_product", to: "carts#delete_cart_product"
  get "get_sub_total", to: "carts#sub_totals"

  # Profile Routes
  get "profile", to: "profiles#profile"
  put "profile", to: "profiles#update_profile"

  # Calculator Routes
  get "calculator", to: "calculators#calculator"
  get "calculate", to: "calculators#calculate"

  # Pages Routes
  get "brand_category", to: "pages#brand_category"
  get "category", to: "pages#category"
  get "shipping_type", to: "pages#shipping_type"
  get "transaction_history", to: "pages#transaction_history"
  get "complete_purchase", to: "pages#complete_purchase"
  get "order_product/:id", to: "pages#order_product", as: :order_product
  get "product_info/:id", to: "pages#product_info", as: :product_info

  # Shipping Address Routes
  get "shipping_address", to: "shipping_address#index"
  get "states", to: "shipping_address#states"
  get "cities", to: "shipping_address#cities"
  get "save_shipping_address", to: "shipping_address#save_shipping_address"
end
