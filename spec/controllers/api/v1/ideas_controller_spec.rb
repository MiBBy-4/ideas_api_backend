require 'rails_helper'
MONTH_DAYS = 10

RSpec.describe 'Ideas', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create(:customer)
      FactoryBot.create_list(:idea, 10)
      get '/api/v1/ideas'
    end
    
    it 'returns all posts' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:customer) { FactoryBot.create(:customer) }
      let!(:full_idea) { FactoryBot.create(:idea) }

      before do
        post '/api/v1/ideas', params:
                          { idea: {
                            name: full_idea.name,
                            description: full_idea.description,
                            problem: full_idea.problem,
                            sphere: full_idea.sphere,
                            geo_focus: full_idea.geo_focus,
                            investor_requirements: full_idea.investor_requirements,
                            team: full_idea.team,
                            next_steps: full_idea.next_steps,
                            customer_id: customer.id,
                            publication_period: Date.today + MONTH_DAYS                             
                          } }
      end

      it 'returns the name' do
        expect(json['idea']['name']).to eq(full_idea.name)
      end

      it 'returns the description' do
        expect(json['idea']['description']).to eq(full_idea.description)
      end

      it 'returns the customer id' do
        expect(json['idea']['customer_id']).to eq(customer.id);
      end

      it 'returns a created status' do
        expect(json['status']).to eq(201)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/ideas', params:
                          { idea: {
                            name: '',
                            description: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(json['status']).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:customer) { FactoryBot.create(:customer) }
      let!(:full_idea) { FactoryBot.create(:idea) }
      CHANGED_NAME = 'Changed Name'

      before do
        patch "/api/v1/ideas/#{full_idea.id}", params:
                              { idea: {
                                name: CHANGED_NAME,                             
                              } }
      end

      it 'returns an updated name' do
        expect(json['name']).to eq(CHANGED_NAME)
      end
    end

    context 'with invalid parameters' do
      let!(:customer) { FactoryBot.create(:customer) }
      let!(:full_idea) { FactoryBot.create(:idea) }
      before do
        patch "/api/v1/ideas/#{full_idea.id}", params:
                              { idea: {
                                name: '',                             
                              } }
      end

      it 'returns a bad status' do
        expect(json['status']).to eq(422)
      end
    end
  end
end
