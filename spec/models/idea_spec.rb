require 'rails_helper'

RSpec.describe 'Idea', type: :model do
  describe 'Idea model' do
    context 'create with valid parameters' do
      let!(:customer) { FactoryBot.create(:customer) }

      before do
        @idea = Idea.new(name: 'Idk', description: 'idk', problem: 'idk', sphere: 'idk', geo_focus: 'idk', team: 'idk',
                        next_steps: 'idk', investor_requirements: 'idk', customer_id: customer.id)
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
        @idea = Idea.new(name: 'Idk', description: 'idk', problem: 'idk', sphere: 'idk', geo_focus: 'idk', team: 'idk',
                        next_steps: 'idk', investor_requirements: 'idk')
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
