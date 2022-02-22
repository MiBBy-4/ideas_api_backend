class ReactionsController < ApplicationController
  respond_to :json
  before_action :find_customer

  def create
    @reaction = @current_customer.reactions.new(reaction_params)
    if !@reaction.save
      render json: {
        status: 500,
      }
    else
      render json: {
        status: :ok,
      }
    end
  end

  def destroy
    @reaction = @current_customer.reactions.find(params[:id])
    idea = @reaction.idea
    @reaction.destroy
    render json: {
      status: :ok,
    }   
  end

  private

  def reaction_params
    params.require(:reaction).permit(:idea_id, :reaction)
  end

  def find_customer
    @current_customer = Customer.find(session[:customer_id])
  end
end