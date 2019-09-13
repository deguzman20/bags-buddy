module Pages
  class CalculatorService < ApplicationService
    attr_accessor :link, :price, :quantity, :brand_id, :category_id

    def initialize(params = {})
      @link        = params[:link]
      @price       = params[:price]
      @quantity    = params[:quantity]
      @brand_id    = params[:brand_id]
      @category_id = params[:category_id]
    end

    def call
      calculate_product_price
    end
  private
    def calculate_product_price
      exchangeRate = 52
      tax = 0.095
      brand_category = BrandCategory.where(brand_id: brand_id.to_i)
                                    .where(category_id: category_id.to_i)
      brand_category.each do |bc|
        @income_rate = bc.additional || 0
      end

      subtotal = price.to_i
      subtotal = ((subtotal + ((subtotal * quantity.to_i || 0) * tax))*exchangeRate) + @income_rate
      subtotal = subtotal.floor(-2)+95
    end
  end
end