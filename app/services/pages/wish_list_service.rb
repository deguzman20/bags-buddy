module Pages
  class WishListService < ApplicationService
    attr_accessor :user_id, :product_id

    def initialize(attr = {})
      @user_id = attr["user_id"].nil? ? nil : attr["user_id"].to_i
      @product_id = attr["product_id"].nil? ? nil : attr["product_id"].to_i
    end

    def call
      add_to_wishlist
    end

    private

      def add_to_wishlist
        wishlist = Wishlist.find_by(user_id: user_id, product_id: product_id)
        if wishlist.present?
          wishlist.quantity += 1
          wishlist.save!
        else
          Wishlist.create(user_id: user_id, product_id: product_id, quantity: 1)
        end
      end

      def method_missing(m, *args, &block)
        "undefined #{m} method"
      end
  end
end
