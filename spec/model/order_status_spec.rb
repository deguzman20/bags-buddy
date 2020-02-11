require "rails_helper"

RSpec.describe OrderStatus, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:orders) }
  end
end
