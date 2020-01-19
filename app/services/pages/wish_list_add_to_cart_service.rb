module Pages
  class WishListAddToCartService < ApplicationService
    attr_accessor :wishlist_id, :user_id
    
    def initialize(attr = {})
      @user_id = attr["user_id"].nil? ? nil : attr["user_id"]
      @wishlist_id = attr["wishlist_id"].nil? ? nil : attr["wishlist_id"]
    end 

    def call
      wishlist_add_to_cart
    end
    
   private
     def wishlist_add_to_cart
       wishlist = Wishlist.find_by(user_id: user_id, id: wishlist_id)
       # Add to cart wishlist and remove from wishlist
       cart = Cart.find(user_id)
       cart.cart_products.build(product_id: wishlist.product.id, price: wishlist.product.price, quantity: wishlist.quantity, item_type_id: 1)
       wishlist.delete if cart.save!
     end   
  end      
end    