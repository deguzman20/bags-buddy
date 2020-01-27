require "rails_helper"

RSpec.describe OrderProduct, type: :model do
  describe "Associations" do
    it { should belong_to(:order).optional }
    it { should belong_to(:product).optional }
  end
end

