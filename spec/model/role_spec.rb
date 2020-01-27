require "rails_helper"

RSpec.describe Role, type: :model do
  describe Role do
    describe "Assocication" do
      it { is_expected.to belong_to(:resource).optional(:true) }
    end

    # context "Validations" do
    #   it { should validate_inclusion_of(:resource_type).in_arr.allow_nil}
    # end
  end
end
