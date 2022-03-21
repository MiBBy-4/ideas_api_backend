require 'rails_helper'

RSpec.describe 'Registration', type: :request do
  describe 'customer registration' do
    let!(:email) { Faker::Internet::email }
    let!(:password) { Faker::Internet::password }
    let!(:name) { Faker::Name.first_name }
    let!(:surname) { Faker::Name.last_name }
    context 'with valid parameters' do
      before do
        post '/users/registrations', params:
                            { customer: {
                              email: email,
                              password: password,
                              password_confirmation: password,
                              name: name,
                              surname: surname,  
                              skype: name                            
                            } }
      end
      
      it 'returns the email' do
        expect(json['customer']['email']).to eq(email) 
      end
      it 'returns the name' do
        expect(json['customer']['name']).to eq(name) 
      end
      it 'return success code status' do
        expect(json['status']).to eq(201)
      end
    end
    context 'with invalid parameters' do
      before do
        post '/users/registrations', params:
                            { customer: {
                              email: name,
                              password: password,
                              password_confirmation: password,
                              name: name,
                              surname: surname,  
                              skype: name                            
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
