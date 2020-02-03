require "rails_helper"

RSpec.describe PagesController, type: :controller do
  let(:products) { Product.all }
  let(:pre_orders) { PreOrder.all }
  let(:carousels) { Carousel.limit(5) }
  let(:brands) { Brand.all.decorate }
  
  describe "GET #home" do
    it "check instance variable for home action" do
      get :home
      expect(assigns(:products)).to eq(products)
      expect(assigns(:pre_orders)).to eq(pre_orders)
      expect(assigns(:carousels)).to eq(carousels)
      expect(assigns(:brands)).to eq(brands)
    end
  end
end
# rspec json schema