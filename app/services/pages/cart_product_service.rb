module Pages
  class CartProductService < ApplicationService
    attr_accessor :user_id, :product_id

    def initialize(user_id, product_id)
      @user_id     = user_id
      @product_id  = product_id
    end

    def call
      add_to_cart_product
    end
  private

    def add_to_cart_product
      cart_id = Cart.find_by_user_id(user_id.to_i).id
      @product = CartProduct.find_by_product_id(product_id)
      if @product.present?
        @product.quantity += 1
        @product.save!
      else
        cart_product = CartProduct.new
        cart_product.cart_id = cart_id
        cart_product.product_id = product_id
        cart_product.quantity = 1
        cart_product.save!
      end
    end
  end
end