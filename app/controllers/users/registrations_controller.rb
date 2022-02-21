class Users::RegistrationsController < ApplicationController
  respond_to :json

  def create
    customer = Customer.create!(
      email: params['customer']['email'],
      password: params['customer']['password'],
      password_confirmation: params['customer']['password_confirmation'],
      role: params['customer']['role'],      
    )

    if customer
      session[:customer_id] = customer.id
      render json: {
        status: :created,
        customer: customer
      }
    else
      render json: {
        status: 500
      }
    end
  end
end
