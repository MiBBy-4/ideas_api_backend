require 'rails_helper'

RSpec.describe 'Ideas', type: :request do
  describe 'GET /index' do
    before do
      @customer = FactoryBot.create(:customer)
      @ideas = FactoryBot.create_list(:idea, 10)
      get '/api/v1/ideas'
    end
    
    it 'returns all posts' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end