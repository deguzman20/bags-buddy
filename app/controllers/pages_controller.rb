# Page Controller
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
    pre_order   = PreOrder.where(brand_id: brand_id.to_i)
                          .where(category_id: category_id.to_i).first

    eta_sea = pre_order.eta_sea.nil? ? nil : { id: 1, name: "Via Sea" }
    eta_air = pre_order.eta_air.nil? ? nil : { id: 2, name: "Via Air" }
    shipment_type << eta_sea unless eta_sea.nil?
    shipment_type << eta_air unless eta_air.nil?

    render json: shipment_type
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

  def product_info
    @product_info = Product.find(params[:id])
  end
end
