class ReactionsController < ApplicationController
  respond_to :json

  def create
    current_customer = Customer.find(session[:customer_id])
    @reaction = current_customer.reactions.new(reaction_params)
    if !@reaction.save
      render json: {
        status: 500,
      }
    end

    render json: {
      status: :ok,
    }
  end

  def destroy
    current_customer = Customer.find(session[:customer_id])
    @reaction = current_customer.reactions.find(params[:id])
    idea = @reaction.idea
    @reaction.destroy
    render json: {
      status: :ok,
    }   
  end

  private

  def reaction_params
    params.require(:reaction).permit(:idea_id)
  end
end