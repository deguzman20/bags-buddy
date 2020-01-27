# WishList Controller
class WishlistController < ApplicationController
  def index
    return redirect_to new_user_session_path unless user_signed_in?

    @wishlists = current_user.wishlists
  end

  def add_to_wishlist
    return render json: "Empty Session".to_json unless user_signed_in?

    @wishlist = Pages::WishListService.call(params.merge!("user_id" => current_user.id))
    render json: "Successfuly added" if @wishlist
  end

  def remove_item_from_wishlist
    return unless user_signed_in?

    wishlist = Wishlist.find(params[:id])
    render json: "Item Removed".to_json if wishlist.delete
  end

  def wishlist_add_to_cart
    Pages::WishListAddToCartService.call(params.merge!("user_id" => current_user.id)) if user_signed_in?
  end
end
