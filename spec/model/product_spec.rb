require "rails_helper"

RSpec.describe Product, type: :model do
  describe Product do
    describe "Associations" do
      it { should belong_to(:brand) }
      it { should belong_to(:category) }
      it { should have_many(:cart_products) }
      it { should have_many(:cart).through(:cart_products) }
      it { should have_many(:order_products) }
      it { should have_many(:orders).through(:order_products) }
      it { should have_many(:image_galleries) }
    end

    describe "Validations" do
      it { should validate_presence_of(:name) }   
      it { should validate_presence_of(:image) }   
      it { should validate_presence_of(:price) }   
      it { should validate_presence_of(:product_description) }   
    end
  end
end
