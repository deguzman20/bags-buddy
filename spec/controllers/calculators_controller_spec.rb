require "rails_helper"

RSpec.describe CalculatorsController, type: :controller do
  let(:brands) { Brand.all.decorate }
  let(:categories) { Category.all.decorate }

  describe "GET #calculator" do
    it "check instance variable for calculator method if it's equal to brand and category let variable" do
      get :calculator
      expect(assigns(:brands)).to eq(brands)
      expect(assigns(:categories)).to eq(categories)
    end
  end

  # describe "GET #calculate" do
  #   it "calculate's the total price of pre order item"
  # end

  # describe "GET #calculate" do
  #   get :calculate
  #   expect(assigns())
  # end
end
