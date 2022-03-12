class Api::V1::ResponsesController < ApplicationController
  respond_to :json
  before_action :find_customer, only: [:create]
  before_action :set_response, only: [:show]

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

  def show
    render json: {
      status: 200,
      investor: @response.customer
    }
  end

  private

  def set_response  
    @response = Response.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:idea_id)
  end

  def find_customer
    @current_customer = Customer.find(session[:customer_id])
  end
end