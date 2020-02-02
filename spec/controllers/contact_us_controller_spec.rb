require "rails_helper"

RSpec.describe ContactUsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:ok)
    end
  end
end
