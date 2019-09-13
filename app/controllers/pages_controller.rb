# controller for page
class PagesController < ApplicationController
  def home
    @products   = Product.all
    @portals    = Portal.all
    @carousels  = Carousel.limit(5)
    @brands     = Brand.all.decorate
  end

  def brand_category
    brand_category = BrandCategory.where(brand_id: params[:id])
    render json: brand_category
  end

  def category
    category = Category.find(params[:category_id])
    render json: {id: category.id, name: category.name}
  end

  def cart
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
    #   redirect_to cart_path if cart_product
    # else
    #   redirect_to new_user_session_path
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

  def update_profile
    profile_form = ProfileForm.new(
                      params[:profile_form].merge(id: current_user.id)
                    ).update

    if profile_form
      redirect_to profile_path
      flash[:success] = "Successfuly Update"
    end
  end

  def transaction_history; end

  def get_sub_total
    if user_signed_in?
      subtotal = 0
      cart = Cart.find_by_user_id(current_user.id)
      CartProduct.where(cart_id: cart.id).each do |cart_product|
        subtotal += cart_product.product.price * cart_product.quantity
      end
      render json: subtotal.to_json
    end
  end

  def calculator
    @brands = Brand.all.decorate
    @categories = Category.all.decorate
  end

  def calculate
    calculate = Pages::CalculatorService.call(params)
    render json: calculate.to_json
  end
end
