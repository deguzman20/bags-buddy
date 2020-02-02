require "rails_helper"

RSpec.describe Wishlist, type: :model do
  context "when field's are nil" do
    let(:wishlist) { build(:wishlist) }

    it "ensure presence of product_id" do
      wishlist.product_id = nil
      expect(wishlist.save).to eq(false)
    end

    it "ensure presence of user_id" do
      wishlist.user_id = nil
      expect(wishlist.save).to eq(false)
    end

    it "ensure presence of quantity" do
      wishlist.quantity = nil
      expect(wishlist.save).to eq(false)
    end
  end

  describe "Associations" do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:user) }
  end
end
