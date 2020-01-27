require "rails_helper"

RSpec.describe PreOrder, type: :model do
  describe "Associations" do
    it { should belong_to(:brand) }
    it { should belong_to(:category) }
  end
end
