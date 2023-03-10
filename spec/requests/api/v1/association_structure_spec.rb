require 'rails_helper'

RSpec.describe "Api::V1::AssociationStructures", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/association_structure/create"
      expect(response).to have_http_status(:success)
    end
  end

end
