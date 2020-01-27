require "rails_helper"

RSpec.describe EstimatedTimeOfArrival, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:cart_products) }
  end
end
