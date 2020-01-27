require "rails_helper"

RSpec.describe Brand, type: :model do
  describe "Associations" do
    it { is_expected.to have_one(:pre_order) }
    it { is_expected.to have_one(:product) }
    it { is_expected.to have_many(:brand_categories) }
    it { is_expected.to have_many(:categories).through(:brand_categories) }
  end
end
