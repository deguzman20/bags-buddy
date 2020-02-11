require "rails_helper"

RSpec.describe Role, type: :model do
  describe "Assocication" do
    it { is_expected.to belong_to(:resource).optional }
  end
end
