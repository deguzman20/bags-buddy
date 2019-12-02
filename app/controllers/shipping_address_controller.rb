# shipping address controller
class ShippingAddressController < ApplicationController
  def index
    with_product = []
    without_product = []
    exchange_rate = ExchangeRate.first.value
    if user_signed_in?
      User.find(current_user.id).cart.cart_products.each do |cart_product|
        if cart_product.product_id.nil?
          without_product << (cart_product.price * cart_product.quantity) * exchange_rate
        else
          with_product << cart_product.product.price * cart_product.quantity
        end
        with_product_sum = with_product.inject(0) { |sum, x| sum + x }
        without_product_sum = without_product.inject(0) { |sum, y| sum + y }
        @remaining_balances = (with_product_sum + without_product_sum) / 2
      end
    end
  end

  def states
    states = State.all
    render json: states
  end

  def cities
    cities = City.where(state_id: params[:state_id])
    render json: cities
  end
end
