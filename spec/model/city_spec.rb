require "rails_helper"

RSpec.describe City, type: :model do
  describe "Association" do
    it { should belong_to(:state) }       
  end
end
