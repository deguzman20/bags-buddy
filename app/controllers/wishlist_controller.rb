class WishlistController < ApplicationController
  def index
    if user_signed_in?
      @wishlists = current_user.wishlists
    else
      redirect_to new_user_session_path
    end  
  end

  def add_to_wishlist
    if user_signed_in?
      @wishlist = Pages::WishListService.call(params.merge!("user_id" => current_user.id))
      render json: "Successfuly added" if @wishlist  
    else
      render json: "Empty Session".to_json
    end    
  end  

  def remove_item_from_wishlist
  if user_signed_in?
      wishlist = Wishlist.find(params[:id])
      render json: "Item Removed".to_json if wishlist.delete 
    end  
  end  

  def wishlist_add_to_cart
    if user_signed_in?
      add_to_cart = Pages::WishListAddToCartService.call(params.merge!("user_id" => current_user.id))
    end  
  end  
end
