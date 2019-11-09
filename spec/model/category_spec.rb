require "rails_helper"

RSpec.describe Category, type: :model do
  describe Category do
    describe "associations" do
      it { is_expected.to have_many(:portals) }
      it { is_expected.to have_many(:products) }
      it { is_expected.to have_many(:brand_categories) }
      it { is_expected.to have_many(:brands).through(:brand_categories) }
    end
  end
end
