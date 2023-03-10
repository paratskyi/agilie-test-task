require 'rails_helper'

RSpec.describe "Api::V1::Conditions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/conditions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/conditions/create"
      expect(response).to have_http_status(:success)
    end
  end

end
