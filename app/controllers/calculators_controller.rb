# Calculator Controller
class CalculatorsController < ApplicationController
  def calculator
    @brands = Brand.all.decorate
    @categories = Category.all.decorate
  end

  def calculate
    calculate = Pages::CalculatorService.call(params)
    render json: calculate.to_json
  end
end
