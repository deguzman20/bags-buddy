class PagesController < ApplicationController  
  def home
    @products   = Product.all
    @pre_orders = PreOrder.all
    @carousels  = Carousel.limit(5)
    @brands     = Brand.all.decorate
  end

  def brand_category
    brand_category = BrandCategory.where(brand_id: params[:id])
    render json: brand_category
  end

  def category
    category = Category.find(params[:category_id])
    render json: { id: category.id, name: category.name }
  end

  def shipping_type
    shipment_type = []
    brand_id = params[:brand_id]
    category_id = params[:category_id]
    pre_order   = PreOrder.where(brand_id: brand_id)
                          .where(category_id: category_id).first
    eta_sea = pre_order.ETA_sea.nil? ? nil : { id: 1, name: "Via Sea" }
    eta_air = pre_order.ETA_air.nil? ? nil : { id: 2, name: "Via Air" }
    shipment_type << eta_sea unless eta_sea.nil?
    shipment_type << eta_air unless eta_air.nil?
    render json: shipment_type
  end

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
      redirect_to cart_path if cart_product
    else
      redirect_to new_user_session_path
    end
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

  def profile
    if user_signed_in?
      @profile_form = ProfileForm.new(id: current_user.id)
    else
      redirect_to root_path
    end
  end

  def update_successful
    redirect_to profile_path
    flash[:success] = "Successfuly Update"
  end

  def update_profile
    profile_form = ProfileForm.new(
      params[:profile_form].merge(id: current_user.id)
    ).update

    update_successful if profile_form
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
      Batch.select { |btch| btch.from <= DateTime.now && btch.to >= DateTime.now }
           .pluck(:id).each { |i| batch_id = i.to_i }
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

  def complete_purchase(id)
    save_order(id) if user_signed_in?
  end

  def transaction_history
    @orders = Order.where(user_id: current_user.id)
  end

  def order_product
    @exchange_rate = ExchangeRate.first.value.to_f
    @order_products = OrderProduct.where(order_id: params[:id])
    @subtotal = @order_products.map(&:sub_total).sum
    @total = @order_products.map(&:sub_total).sum * @exchange_rate
    @order_product_shipping_info = Order.find(params[:id]).shipping_address
  end

  def calculator
    @brands = Brand.all.decorate
    @categories = Category.all.decorate
  end

  def calculate
    calculate = Pages::CalculatorService.call(params)
    render json: calculate.to_json
  end

  def product_info
    @product_info = Product.find(params[:id])
  end

  def shipping_address_obj(params = {})
    ShippingAddress.new(user_id: current_user.id, first_name: params[:firstname],
                        last_name: params[:lastname], address: params[:address],
                        apartment: params[:apartment], city_id: params[:city_id].to_i,
                        state_id: params[:state_id].to_i,
                        mobile_number: params[:mobile_number],
                        is_save_info: params[:save_shipping_address])
  end
  
  def save_shipping_address
    if user_signed_in?
      shipping_address = shipping_address_obj(params)
      if shipping_address.save
        complete_purchase(shipping_address.id)
        render json: "Saved successfully".to_json
      end
    end
  end
end
