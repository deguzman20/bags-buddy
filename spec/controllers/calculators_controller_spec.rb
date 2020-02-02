require "rails_helper"

RSpec.describe CalculatorsController, type: :controller do
  describe "GET #calculator" do
    let(:brands) { Brand.all.decorate }
    let(:categories) { Category.all.decorate }

    it "returns draper decorator of brands and categegories" do
      get :calculator
      expect(assigns(:brands)).to eq(brands)
      expect(assigns(:categories)).to eq(categories)
    end
  end

  describe "GET #calculate" do
    
  end  
end
