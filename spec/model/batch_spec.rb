require "rails_helper"

RSpec.describe Batch, type: :model do
  describe "Associations" do
    it { is_expected.to have_many(:order_products) }
  end
end
