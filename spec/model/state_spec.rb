require "rails_helper"

RSpec.describe State, type: :model do
  describe "association" do
    it { should have_many(:cities) }
  end    
end
