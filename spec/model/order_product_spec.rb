require "rails_helper"

RSpec.describe OrderProduct, type: :model do
  describe OrderProduct do
    describe "associations" do
      it { is_expected.to belong_to(:order).optional }
      it { is_expected.to belong_to(:product).optional }
    end
  end
end
