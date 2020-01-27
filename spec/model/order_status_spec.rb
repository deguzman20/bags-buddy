require "rails_helper"

RSpec.describe OrderStatus, type: :model do
  describe "associations" do
    it { should have_many(:orders) }
  end
end
