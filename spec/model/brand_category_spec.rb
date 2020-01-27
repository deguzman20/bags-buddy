require "rails_helper"

RSpec.describe BrandCategory, type: :model do
  describe "Associations" do
    it { should belong_to(:category) }
    it { should belong_to(:brand) }
  end
end
