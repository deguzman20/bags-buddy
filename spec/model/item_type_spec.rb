require "rails_helper"

RSpec.describe ItemType, type: :model do
  describe ItemType do
    describe "associations" do
      it { is_expected.to have_many(:cart_products) }
    end
  end
end
