require "rails_helper"

RSpec.describe Brand, type: :model do
  describe Brand do
    describe "associations" do
      it { is_expected.to have_one(:portal) }
      it { is_expected.to have_one(:product) }
      it { is_expected.to have_many(:brand_categories) }
      it { is_expected.to have_many(:categories).through(:brand_categories) }
    end
  end
end
