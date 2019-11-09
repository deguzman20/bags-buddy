# controller for page
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
    get_sub_total
  end

  def decrease_product_quantity
    cart_product = CartProduct.find(params[:cart_product_id].to_i)
    cart_product.quantity -= 1
    cart_product.save!
    get_sub_total
  end

  def delete_cart_product
    cart_product = CartProduct.find(params[:id].to_i)
    cart_product.delete
    get_sub_total
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

  def get_sub_total
    if user_signed_in?
      subtotal = 0
      exchange_rate = ExchangeRate.first.value
      cart = Cart.find_by_user_id(current_user.id)
      CartProduct.where(cart_id: cart.id).each do |cart_product|
        subtotal += !cart_product.product.nil? ? cart_product.product.price * cart_product.quantity : (cart_product.price * cart_product.quantity) * exchange_rate
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

    order = Order.new
    order.user_id = current_user.id
    order.order_status_id = 1
    order.shipping_address_id = id
    order.payment_order_status_id = 2
    order.down_payment = subtotal / 2
    order.balance = subtotal / 2
    order.total = subtotal
    if order.save
      batch_id = nil
      exchange_rate = ExchangeRate.first.value
      Batch.select { |btch| btch.from <= DateTime.now && btch.to >= DateTime.now }.pluck(:id).each { |id| batch_id = id.to_i }
      cart = Cart.find_by_user_id(current_user.id)
      CartProduct.where(cart_id: cart.id).each do |cp|
        cp_subtotal = 0
        cp_subtotal +=  !cp.product_id.nil? ? cp.product.price * cp.quantity : (cp.price * cp.quantity) * exchange_rate
        order_product = OrderProduct.new
        order_product.order_id = order.id
        order_product.product_id = cp.product_id
        order_product.sub_total = cp_subtotal
        order_product.batch_id = batch_id
        CartProduct.where(cart_id: cart.id).delete_all if order_product.save
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

  def save_shipping_address
    if user_signed_in?
      shipping_address = ShippingAddress.new(user_id: current_user.id, first_name: params[:firstname],
                                             last_name: params[:lastname], address: params[:address],
                                             apartment: params[:apartment], city_id: params[:city_id].to_i,
                                             state_id: params[:state_id].to_i, email: params[:email],
                                             mobile_number: params[:mobile_number],
                                             is_save_info: params[:save_shipping_address])
      if shipping_address.save
        complete_purchase(shipping_address.id)
        render json: "Saved successfully".to_json
      end
    end
 end
end
