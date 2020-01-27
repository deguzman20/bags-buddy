require "rails_helper"

RSpec.describe Product, type: :model do
  describe Product do
    describe "Associations" do
      it { is_expected.to belong_to(:brand) }
      it { is_expected.to belong_to(:category) }
      it { is_expected.to have_many(:cart_products) }
      it { is_expected.to have_many(:cart).through(:cart_products) }
      it { is_expected.to have_many(:order_products) }
      it { is_expected.to have_many(:orders).through(:order_products) }
      it { is_expected.to have_many(:image_galleries) }
    end

    describe "Validations" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:image) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:product_description) }
    end
  end
end
