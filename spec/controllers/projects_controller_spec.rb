require 'rails_helper'

RSpec.describe "Projects", type: :controller do
  describe "GET /show" do
    it "returns http success" do
      get "/projects/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/projects/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /leave_comment" do
    it "returns http success" do
      get "/projects/leave_comment"
      expect(response).to have_http_status(:success)
    end
  end
end
