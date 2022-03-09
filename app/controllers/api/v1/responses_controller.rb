class Api::V1::ResponsesController < ApplicationController
  respond_to :json
  before_action :find_customer

  def create
    @response = @current_customer.responses.new(response_params)
    if @response.save
      render json: {
        status: 200,
        response: @response
      }
    else
      render json: {
        status: 422,
        errors: @response.errors
      }
    end
  end

  private

  def response_params
    params.require(:response).permit(:idea_id)
  end

  def find_customer
    @current_customer = Customer.find(session[:customer_id])
  end
end