require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:pre_orders) }
    it { is_expected.to have_many(:products) }
    it { is_expected.to have_many(:brand_categories) }
    it { is_expected.to have_many(:brands).through(:brand_categories) }
  end
end
