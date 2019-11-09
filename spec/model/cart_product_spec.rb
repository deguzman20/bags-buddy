require "rails_helper"

RSpec.describe CartProduct, type: :model do
  describe CartProduct do
    describe "associations" do
      it { is_expected.to belong_to(:cart).optional }
      it { is_expected.to belong_to(:product).optional }
      it { is_expected.to belong_to(:item_type).optional }
    end
  end
end
