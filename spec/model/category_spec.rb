require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Associations" do
    it { should have_many(:pre_orders) }
    it { should have_many(:products) }
    it { should have_many(:brand_categories) }
    it { should have_many(:brands).through(:brand_categories) }
  end
end
