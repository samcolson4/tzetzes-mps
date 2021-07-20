require 'rails_helper'

RSpec.describe "MPs API", type: :request do
  describe "GET /:id" do
    it 'Returns JSON' do
      get "/api/v1/mps/0" 
      expect(response.content_type).to eq 'application/json'
    end

    it 'Returns a success status code' do
      get "/api/v1/mps/0" 
      expect(response).to have_http_status(:success)
    end

    it 'has content' do
      get "/api/v1/mps/0" 
      expect(response.parsed_body['id']).to eq 0
      expect(response.parsed_body['name']).to eq 'Ms Diane Abbott'
    end
  end
end
