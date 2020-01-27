require "rails_helper"

RSpec.describe PaymentOrderStatus, type: :model do
  describe "Associations" do
    it { should have_many(:orders) }
  end
end
