class Users::SessionsController < ApplicationController
  respond_to :json
  include CurrentCustomerConcern

  def create
    customer = Customer.find_by(email: params['customer']['email']).try(:authenticate, params['customer']['password'])

    if customer
      session[:customer_id] = customer.id
      render json: {
        status: :created,
        logged_in: true,
        customer: customer
      }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_customer
      render json: {
        logged_in: true,
        customer: @current_customer
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: {
      status: 200,
      logged_out: true
    }
  end
end
