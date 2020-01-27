require "rails_helper"

RSpec.describe Order, type: :model do
  describe "Associations" do
    it { should have_many(:order_products) }
    it { should belong_to(:user).optional }
    it { should belong_to(:order_status).optional }
    it { should belong_to(:payment_order_status) }
  end
end
