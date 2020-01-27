# shipping address controller
class ShippingAddressController < ApplicationController
  def index
    with_product = []
    without_product = []
    exchange_rate = ExchangeRate.first.value
    return unless user_signed_in?

    User.find(current_user.id).cart.cart_products.each do |cart_product|
      if cart_product.product_id.nil?
        without_product << (cart_product.price * cart_product.quantity) * exchange_rate
      else
        with_product << cart_product.product.price * cart_product.quantity
      end
      with_product_sum = with_product.inject(0) { |sum, x| sum + x }
      without_product_sum = without_product.inject(0) { |sum, y| sum + y }
      @remaining_balances = (with_product_sum + without_product_sum) / 2
      @cart_products = Cart.find_by_user_id(current_user.id).cart_products
      @grand_total = current_user.cart.cart_products.map { |cp| cp.product.quantity * cp.quantity }.sum
    end
  end

  def save_order(id)
    subtotal = 0
    exchange_rate = ExchangeRate.first.value
    cart = Cart.find_by_user_id(current_user.id)
    CartProduct.where(cart_id: cart.id).each do |cart_product|
      subtotal += !cart_product.product.nil? ? cart_product.product.price * cart_product.quantity : (cart_product.price * cart_product.quantity) * exchange_rate
    end
    order = Order.new(user_id: current_user.id, order_status_id: 1, payment_order_status_id: 2, down_payment: 0, balance: subtotal,
                      total: subtotal, shipping_address_id: id)
    if order.save
      batch_id = nil
      exchange_rate = ExchangeRate.first.value
      Batch.select { |btch| btch.from <= DateTime.now && btch.to >= DateTime.now }.pluck(:id).each { |i| batch_id = i.to_i }
      cart = Cart.find_by_user_id(current_user.id)
      CartProduct.where(cart_id: cart.id).each do |cp|
        cp_subtotal = 0
        cp_subtotal += !cp.product_id.nil? ? cp.product.price * cp.quantity : (cp.price * cp.quantity) * exchange_rate
        order_product = OrderProduct.new(order_id: order.id, product_id: cp.product_id, sub_total: cp_subtotal, batch_id: batch_id)
        next unless order_product.save

        CartProduct.where(cart_id: cart.id).delete_all if OrderMailer.order_smtp(current_user.email).deliver!
      end
    else
      pp order.errors.full_messages
    end
  end

  def shipping_address_obj(params = {})
    ShippingAddress.new(user_id: current_user.id, first_name: params[:firstname],
                        last_name: params[:lastname], address: params[:address],
                        apartment: params[:apartment], city_id: params[:city_id].to_i,
                        state_id: params[:state_id].to_i,
                        mobile_number: params[:mobile_number],
                        is_save_info: params[:save_shipping_address],
                        email: params[:email])
  end

  def complete_purchase(id)
    save_order(id) if user_signed_in?
  end

  def save_shipping_address
    shipping_address = shipping_address_obj(params)
    return unless user_signed_in? && !shipping_address.save

    complete_purchase(shipping_address.id)
    render json: "Saved successfully".to_json
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
