require "rails_helper"

RSpec.describe Brand, type: :model do
  describe "Associations" do
    it { should have_one(:pre_order) }
    it { should have_one(:product) }
    it { should have_many(:brand_categories) }
    it { should have_many(:categories).through(:brand_categories) }
  end
end
