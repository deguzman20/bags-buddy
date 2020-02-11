require "rails_helper"

RSpec.describe CalculatorsController, type: :controller do
  let(:brands) { Brand.all.decorate }
  let(:categories) { Category.all.decorate }
  let(:params) { {link: "sample123.com", price: 100, quantity: 10, brand_id: 29, category_id: 1} }

  describe "GET #calculator" do
    it "check instance variable for calculator method if it's equal to brand and category let variable" do
      get :calculator
      expect(assigns(:brands)).to eq(brands)
      expect(assigns(:categories)).to eq(categories)
    end
  end

  # describe "GET #calculate" do
  #   it "calculate pre order" do
  #     get :calculate

  #     calculate = Pages::Calculator.call(params)
  #     expect(calculate).to eq?(true)
  #   end
  # end
end
