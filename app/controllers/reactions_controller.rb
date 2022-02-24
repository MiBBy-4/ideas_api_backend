class ReactionsController < ApplicationController
  respond_to :json
  before_action :find_customer

  def index
    current_customer_reactions = @current_customer.reactions
    render json: {
      current_customer_reactions: current_customer_reactions,
    }
  end

  def create
    @reaction = @current_customer.reactions.new(reaction_params)
    idea_id = @reaction.idea_id
    if Reaction.exists?(customer_id: session[:customer_id], idea_id: idea_id)
      reaction = Reaction.where(customer_id: session[:customer_id], idea_id: idea_id).last
      if reaction.reaction === nil
        reaction.attributes = { reaction: @reaction.reaction }
        reaction.save
        render json: {
          status: 'Change from nil to bool',
        }
      else
        reaction.attributes = { reaction: nil }
        reaction.save
        render json: {
          status: 'Change to nil'
        }
      end
    else
      if @reaction.save
        render json: {
          status: :ok,
        }
      else
        render json: {
          status: 500,
        }
      end
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
