require 'rails_helper'

RSpec.describe 'Idea', type: :model do
  describe 'Customer model' do
    context 'validate with already taken email' do
      let!(:customer) { FactoryBot.create(:customer) }

      before do
        @customer = Customer.new(email: customer.email, password: customer.password,
                                  password_confirmation: customer.password, name: customer.name, surname: customer.surname, skype: customer.skype)
      end

      it 'returns that customer is not valid' do
        expect(@customer).to_not be_valid  
      end
      it 'returns an email error message' do
        @customer.valid?
        expect(@customer.errors.full_messages.include?('Email has already been taken')).to eq(true)
      end
    end

    context 'validate with uncorrect password confirmation' do
      let!(:customer) { FactoryBot.create(:customer) }

      before do
        @customer = Customer.new(email: customer.email, password: customer.password,
                                  password_confirmation: 'test', name: customer.name, surname: customer.surname, skype: customer.skype)
      end

      it 'returns that customer is not valid' do
        expect(@customer).to_not be_valid  
      end
      it 'returns an password confirmation error message' do
        @customer.valid?
        expect(@customer.errors.full_messages.include?("Password confirmation doesn't match Password")).to eq(true)
      end
    end

    context 'validate with correct parameters' do
      let!(:customer) { FactoryBot.create(:customer) }
      let!(:idea) { FactoryBot.create(:idea) }

      before do
        @customer = Customer.new(email: 'notusedemail@gmail.com', password:'test',
                                  password_confirmation:'test', name:'test', surname: 'test', skype:'testt')
      end

      it 'returns that customer is valid' do
        expect(@customer).to be_valid
      end
      it 'creates reaction to this customer' do
        reaction = @customer.reactions.new(idea_id: idea.id)
        expect(reaction).to be_valid
      end

      it 'creates response to this customer' do
        response =  @customer.responses.new(idea_id: idea.id)
        expect(response).to be_valid
      end
    end
  end 
end