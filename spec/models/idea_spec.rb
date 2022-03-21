require 'rails_helper'

RSpec.describe 'Idea', type: :model do
  describe 'Idea model' do
    let!(:customer) { FactoryBot.create(:customer) }
    let!(:name) { Faker::Lorem.sentence }
    let!(:description) { Faker::Lorem.paragraph }
    let!(:problem) { Faker::Lorem.paragraph }
    let!(:sphere) { Faker::Lorem.sentence }
    let!(:geo_focus) { Faker::Lorem.sentence(word_count: 1) }
    let!(:investor_requirements) { Faker::Lorem.paragraph }
    let!(:team) { Faker::Lorem.paragraph }
    let!(:next_steps) { Faker::Lorem.paragraph }
    context 'create with valid parameters' do
      before do
        @idea = Idea.new(name: name, description: description, problem: problem, sphere: sphere, geo_focus: geo_focus, team: team,
                        next_steps: next_steps, investor_requirements: investor_requirements, customer_id: customer.id)
      end

      it 'returns that idea is valid' do
        expect(@idea).to be_valid  
      end

      it 'creates reaction to this idea' do
        reaction = @idea.reactions.new(customer_id: customer.id)
        expect(reaction).to be_valid
      end

      it 'creates response to this idea' do
        response =  @idea.responses.new(customer_id: customer.id)
        expect(response).to be_valid
      end
    end

    context 'create without customer' do
      before do
        @idea = Idea.new(name: name, description: description, problem: problem, sphere: sphere, geo_focus: geo_focus, team: team,
                        next_steps: next_steps, investor_requirements: investor_requirements)
      end

      it 'returns that idea is invalid' do
        expect(@idea).to_not be_valid
      end
      it 'returns an error message that idea should include customer' do
        @idea.valid?
        expect(@idea.errors.full_messages.include?('Customer must exist')).to eq(true)
      end
    end
  end
end
