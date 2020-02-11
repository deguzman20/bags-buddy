module Pages
  class AddToCartProductService < ApplicationService
    attr_accessor :user_id, :product_id, :quantity,
                  :price, :additional, :shipping_type_id

    def initialize(user_id, product_id, quantity)
      @user_id       = user_id
      @product_id    = product_id
      @quantity      = quantity
    end

    def call
      add_to_cart_product
    end

    private

      def add_to_cart_product
        cart_id = Cart.find_by_user_id(user_id.to_i).id
        price = Product.find(product_id).price
        @product = CartProduct.find_by_product_id(product_id)
        if @product.present?
          @product.quantity += quantity
          @product.save!
        else
          CartProduct.create(cart_id: cart_id, product_id: product_id,
                             quantity: quantity, item_type_id: 1, price: price)
        end
      end

      def method_missing(m, *args, &block)
        "undefined #{m} method"
      end
  end
end
