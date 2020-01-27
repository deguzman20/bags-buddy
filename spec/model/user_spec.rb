require "rails_helper"

RSpec.describe User, type: :model do
  context "Validation tests" do
    let(:user) { build(:user) }

    it 'ensure presence of first_name' do
      user.first_name = nil
      expect(user.save).to eq(false)  
    end  

    # it "ensure presence of last_name" do
    #   user.last_name = nil
    #   expect(user.save).to eq(false)  
    # end  

    # it "ensure presence of birthdate" do
    #   user.birthdate = nil
    #   expect(user.save).to eq(false)  
    # end  
    
    # it "ensure presence of email" do
    #   user.email = nil
    #   expect(user.save).to eq(false)  
    # end  

    # it "ensure presence of password" do
    #   user.password = nil
    #   expect(user.save).to eq(false)  
    # end  

    # it "ensure presence of is_admin" do
    #   user.admin = nil
    #   expect(user.save).to eq(false)  
    # end  
  end 

  describe "Associations" do
    it { should have_one(:cart) }
    it { should have_many(:orders) }
  end
end
