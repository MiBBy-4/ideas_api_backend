class Users::RegistrationsController < ApplicationController
  respond_to :json

  def create
    customer = Customer.create!(
      email: params['customer']['email'],
      password: params['customer']['password'],
      password_confirmation: params['customer']['password_confirmation'],
      role: params['customer']['role'],
      name: params['customer']['name'],
      surname: params['customer']['surname'],
      phone_number: params['customer']['phone_number'],
      skype: params['customer']['skype'],
    )

    if customer
      session[:customer_id] = customer.id
      render json: {
        status: 201,
        customer: customer
      }
    else
      render json: {
        erorrs: customer.erorrs,
        status: 422
      }
    end
  end
end
