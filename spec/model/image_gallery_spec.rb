require "rails_helper"

RSpec.describe ImageGallery, type: :model do
  describe "Validations" do
    it { should belong_to(:product).optional } 
  end      
end
