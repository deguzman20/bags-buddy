require "rails_helper"

RSpec.describe Product, type: :model do
  describe Product do
    describe "associations" do
      it { is_expected.to belong_to(:brand) }
      it { is_expected.to belong_to(:category) }
      it { is_expected.to have_one(:cart_product) }
      it { is_expected.to have_many(:order_products) }
    end
  end
end
