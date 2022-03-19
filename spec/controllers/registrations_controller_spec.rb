require 'rails_helper'

RSpec.describe 'Registration', type: :request do
  describe 'customer registration' do
    context 'with valid parameters' do
      before do
        post '/users/registrations', params:
                            { customer: {
                              email: 'testmail@gmail.com',
                              password: 'test123',
                              password_confirmation: 'test123',
                              name: 'boban',
                              surname: 'mamimenko',  
                              skype: 'bogdanbogomdan'                            
                            } }
      end
      
      it 'returns the email' do
        expect(json['customer']['email']).to eq('testmail@gmail.com') 
      end
      it 'returns the name' do
        expect(json['customer']['name']).to eq('boban') 
      end
      it 'return success code status' do
        expect(json['status']).to eq(201)
      end
    end
    context 'with invalid parameters' do
      before do
        post '/users/registrations', params:
                            { customer: {
                              email: 'testmail',
                              password: 'test123',
                              password_confirmation: 'test123',
                              name: 'boban',
                              surname: 'mamimenko',  
                              skype: 'bogdanbogomdan'                            
                            } }
      end

      it 'returns error message that email is invalid' do
        expect(json['errors'].include?('Email is invalid')).to eq(true)
      end
      it 'returns bad code status' do
        expect(json['status']).to eq(422)
      end
    end
  end
end