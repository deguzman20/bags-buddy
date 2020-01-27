require "rails_helper"

RSpec.describe CartProduct, type: :model do
  describe "Associations" do
    it { should belong_to(:cart).optional }
    it { should belong_to(:product).optional }
    it { should belong_to(:item_type).optional }
  end
  
end
