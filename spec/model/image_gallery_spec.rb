require "rails_helper"

RSpec.describe ImageGallery, type: :model do
  describe "Validations" do
    it { is_expected.to belong_to(:product).optional }
  end
end
