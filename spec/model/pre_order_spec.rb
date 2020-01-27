require "rails_helper"

RSpec.describe PreOrder, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:brand) }
    it { is_expected.to belong_to(:category) }
  end
end
