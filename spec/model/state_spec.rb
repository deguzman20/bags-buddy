require "rails_helper"

RSpec.describe State, type: :model do
  describe "association" do
    it { is_expected.to have_many(:cities) }
  end
end
