require "rails_helper"

RSpec.describe PaymentOrderStatus, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:orders) }
  end
end
