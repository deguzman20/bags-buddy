require "rails_helper"

RSpec.describe User, type: :model do
  context "when field's are nil" do
    let(:user) { build(:user) }

    it "ensure presence of first_name" do
      user.first_name = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of last_name" do
      user.last_name = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of birthdate" do
      user.birthdate = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of email" do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of password" do
      user.password = nil
      expect(user.save).to eq(false)
    end

    it "ensure presence of is_admin" do
      user.admin = nil
      expect(user.save).to eq(false)
    end
  end

  context "when all field's are not nil" do
    let(:user) { build(:user) }

    it "will save new user" do
      user.first_name = "andy"
      user.last_name = "deguzman"
      user.birthdate = DateTime.now
      user.email = "andydeguzman11@gmail.com"
      user.admin = true
      user.password = "deguzman123"
      expect(user.save).to eq(true)
    end
  end

  describe "Associations" do
    it { is_expected.to have_one(:cart) }
    it { is_expected.to have_many(:orders) }
  end
end
