module Pages
  class CartProductService < ApplicationService
    attr_accessor :user_id, :product_id, :item_type_id, :quantity, :price, :attrib, :additional

    def initialize(user_id, product_id, attr = {})
      @attrib        = attr
      @user_id       = user_id
      @product_id    = product_id
      @item_type_id  = attr[:item_type_id].nil? ? 1 : 2
      @quantity      = attr[:quantity].nil? ? 1 : attr[:quantity]
      @price         = attr[:price].nil? ? 0 : attr[:price]
      @additional    = attr[:additional].nil? ? 0 : attr[:additional]
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
          cart_product.quantity = quantity
          cart_product.item_type_id = item_type_id
          cart_product.price       = price
          cart_product.additional  = additional.to_i
          cart_product.save!
        end
      end
  end
end
