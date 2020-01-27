require "rails_helper"

RSpec.describe Order, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:order_products) }
    it { is_expected.to belong_to(:user).optional }
    it { is_expected.to belong_to(:order_status).optional }
    it { is_expected.to belong_to(:payment_order_status) }
  end
end
