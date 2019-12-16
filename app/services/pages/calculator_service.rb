module Pages
  class CalculatorService < ApplicationService
    attr_accessor :link, :price, :quantity, :brand_id, :category_id

    def initialize(params = {})
      @link        = params[:link]
      @price       = params[:price]
      @quantity    = params[:quantity] || 1
      @brand_id    = params[:brand_id]
      @category_id = params[:category_id]
    end

    def call
      calculate_product_price
    end

    private

      def tax
        0.095
      end

      def exchange_rate
        ExchangeRate.first.value.to_i || 0
      end

      def brand_categories
        BrandCategory.where(brand_id: brand_id.to_i).where(category_id: category_id.to_i)
      end

      def calculate_product_price
        additional = PreOrder.where(brand_id: brand_id)
                             .where(category_id: category_id)
        brand_categories.each do |bc|
          @income_rate = bc.additional || 0
        end

        additional.each { |add| @additional = add.additional_price }
        subtotal = ((price.to_i + (price.to_i * tax)) * exchange_rate) + @additional
        { subtotal: subtotal, additional: @additional }
      end
  end
end
