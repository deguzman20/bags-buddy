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
        exchange_rate = ExchangeRate.first.value.to_i
        tax = 0.095
        brand_category = BrandCategory.where(brand_id: brand_id.to_i)
                                      .where(category_id: category_id.to_i)
        additional = PreOrder.where(brand_id: brand_id)
                             .where(category_id: category_id)
        brand_category.each do |bc|
          @income_rate = bc.additional || 0
        end

        additional.each { |add| @additional = add.additional_price }

        # subtotal = price.to_i
        subtotal = ((price.to_i + (price.to_i * tax)) * exchange_rate) + @additional
        # subtotal = subtotal.floor(-2) + 95
        { subtotal: subtotal, additional: @additional }
      end
  end
end
