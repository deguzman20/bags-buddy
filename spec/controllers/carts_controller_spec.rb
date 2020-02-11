require "rails_helper"

RSpec.describe CartsController, type: :controller do
  describe "GET #cart" do
    let(:cart_id) { Cart.find_by_user_id(1) }
    let(:cart_products) { CartProduct.where(cart_id: cart_id) }
    let(:exchage_rate) { ExchangeRate.first }

    before do
      current_user = stub_model(User, id: 1)
      allow(controller).to receive(:current_user).and_return(current_user)
    end

    it "returns checked value of instance variable" do
      get :cart
      expect(assigns(:exchange_rate)).to eq(exchage_rate)
      expect(assigns(:cart_products)).to eq(cart_products)
     end
  end

  describe "GET #add_to_cart" do
    let(:params) { { user_id: 1, product_id: 1, item_type_id: 1, quantity: 1, price: 100, additional: 100, shipping_type_id: 1 } }

    before do
      current_user = stub_model(User, id: 1)
      allow(controller).to receive(:current_user).and_return(current_user)
    end

    it "render get return json message" do
    #   get :add_to_cart, params: { id: 1 }
      
      cart_product = Pages::CartProductService.call(1, 1)
      #@expected = "Successfuly add to cart".to_json
      response.body.should ==  @expected

      expect(cart_product).to eq(true)
    end
  end
end

