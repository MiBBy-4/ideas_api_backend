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
        status: 200,
        customer: customer
      }
    else
      render json: {
        customer.erorrs,
        status: 422
      }
    end
  end
end
