require "rails_helper"

RSpec.describe Portal, type: :model do
  describe Portal do
    describe "associations" do
      it { is_expected.to belong_to(:brand) }
      it { is_expected.to belong_to(:category) }
    end
  end
end
