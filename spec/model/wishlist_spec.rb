require "rails_helper"

RSpec.describe Wishlist, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:user) }
  end
end
