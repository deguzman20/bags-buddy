module Pages
  class CartProductService < ApplicationService
    attr_accessor :user_id, :product_id,
                  :item_type_id, :quantity,
                  :price, :attrib, :additional, :shipping_type_id

    def initialize(user_id, product_id, attr = {})
      @user_id       = user_id
      @product_id    = product_id
      @item_type_id  = attr[:item_type_id].nil? ? 1 : 2
      @quantity      = attr[:quantity].nil? ? 1 : attr[:quantity]
      @price         = attr[:price].nil? ? 0 : attr[:price]
      @additional    = attr[:additional].nil? ? 0 : attr[:additional]
      @shipping_type_id = attr[:shipping_type_id].nil? ? nil : attr[:shipping_type_id]
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
          CartProduct.create(cart_id: cart_id, product_id: product_id,
                             quantity: quantity, item_type_id: item_type_id,
                             price: price, additional: additional,
                             estimated_time_of_arrival_id: shipping_type_id)
        end
      end
  end
end
