require "rails_helper"

RSpec.describe BrandCategory, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:brand) }
  end
end
