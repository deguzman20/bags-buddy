class CartsController < ApplicationController
  def cart
    @exchange_rate = ExchangeRate.first.value.to_i
    if user_signed_in?
      cart_id = Cart.find_by_user_id(current_user.id)
      @cart_products = CartProduct.where(cart_id: cart_id)
    else
      redirect_to new_user_session_path
    end
  end

  def add_to_cart
    if user_signed_in?
      cart_product = Pages::CartProductService.call(
        current_user.id,
        params[:id]
      )
      render json: "Successfuly add to cart".to_json if cart_product
    else
      redirect_to new_user_session_path
    end
  end

  def single_product_add_to_cart
    if user_signed_in?
      cart_product = Pages::AddToCartProductService.call(
        current_user.id,
        params[:id],
        params[:quantity].to_i
      )
      render json: { response: cart_product } if cart_product
    else
      redirect_to new_user_session_path
    end
  end

  def remove_cart_product
    cart_product = CartProduct.find(params[:id].to_i)
    render json: { response: "Cart Product Deleted" } if cart_product.delete
  end

  def non_on_hand_add_to_cart
    if user_signed_in?
      cart_product = Pages::CartProductService.call(
        current_user.id,
        params[:id],
        params
      )
    end
    render json: cart_product.to_json
  end

  def increase_product_quantity
    cart_product = CartProduct.find(params[:cart_product_id].to_i)
    cart_product.quantity += 1
    cart_product.save!
    sub_totals
  end

  def decrease_product_quantity
    cart_product = CartProduct.find(params[:cart_product_id].to_i)
    cart_product.quantity -= 1
    cart_product.save!
    sub_totals
  end

  def delete_cart_product
    cart_product = CartProduct.find(params[:id].to_i)
    cart_product.delete
    sub_totals
 end

  def sub_totals
    if user_signed_in?
      subtotal = 0
      exchange_rate = ExchangeRate.first.value
      cart = Cart.find_by_user_id(current_user.id)
      CartProduct.where(cart_id: cart.id).each do |cart_product|
        product_nil = (cart_product.price * cart_product.quantity) * exchange_rate
        product_not_nil = cart_product.product.price * cart_product.quantity
        subtotal += !cart_product.product.nil? ? product_not_nil : product_nil
      end
      render json: subtotal.to_json
    end
  end
end
