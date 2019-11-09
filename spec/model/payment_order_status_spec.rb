require "rails_helper"

RSpec.describe PaymentOrderStatus, type: :model do
  describe PaymentOrderStatus do
    describe "associations" do
      it { is_expected.to have_many(:orders) }
    end
  end
end
