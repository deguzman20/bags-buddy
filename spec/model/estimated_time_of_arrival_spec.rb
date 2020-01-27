require "rails_helper"

RSpec.describe EstimatedTimeOfArrival, type: :model do
  describe "Associations" do
    it { should have_many(:cart_products) }
  end    
end
