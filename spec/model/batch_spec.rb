require "rails_helper"

RSpec.describe Batch, type: :model do
  
  context "when field's are nil" do
    let(:batch) { build(:batch) }
          
    it "ensure presence of from" do
      batch.from = nil
      expect(batch.save).to eq(false)
    end

    it "ensure presence of to" do
      batch.to = nil
      expect(batch.save).to eq(false)
    end
  end  

  context "when all field's are not nil" do
    let(:batch) { build(:batch) }
  
    it "will create new batch" do
      batch.from = "2019-10-25 07:47:34"
      batch.to = "2019-10-25 07:47:34"
      expect(batch.save).to eq(true)
    end 
  end  

  describe "Associations" do
    it { is_expected.to have_many(:order_products) }
  end
end
