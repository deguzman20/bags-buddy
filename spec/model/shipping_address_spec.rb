require "rails_helper"

RSpec.describe ShippingAddress, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:orders) }
  end   
end
