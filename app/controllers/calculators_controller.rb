# Calculator Controller
class CalculatorsController < ApplicationController
  def calculator
    @brands = Brand.all.decorate
    @categories = Category.all.decorate
  end

  def calculate
    @calculate = Pages::CalculatorService.call(params)
    return unless @calculate

    render json: @calculate.to_json, status: :success
  end
end
