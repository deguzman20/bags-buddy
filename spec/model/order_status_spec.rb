require "rails_helper"

RSpec.describe OrderStatus, type: :model do
  describe OrderStatus do
    describe "associations" do
      it { is_expected.to have_many(:orders) }
    end
  end
end
