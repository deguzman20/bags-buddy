require "rails_helper"

RSpec.describe ShippingAddress, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:orders) }
  end
end
