require "rails_helper"

RSpec.describe OrderProduct, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:order).optional }
    it { is_expected.to belong_to(:product).optional }
  end
end
