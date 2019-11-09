# shipping address controller
class ShippingAddressController < ApplicationController
  def index; end

  def states
    states = State.all
    render json: states
  end

  def cities
    cities = City.where(state_id: params[:state_id])
    render json: cities
  end
end
