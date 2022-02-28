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
    if Reaction.exists?(customer_id: @current_customer.id, idea_id: idea_id)
      exist_reaction = Reaction.where(customer_id: @current_customer.id, idea_id: idea_id).last
      if exist_reaction.liked.nil?
        exist_reaction.attributes = { liked: @reaction.liked }
        exist_reaction.save
        render json: {
          status: 'Change from nil to bool',
        }
      else
        if (exist_reaction.liked && !@reaction.liked) || (!exist_reaction.liked && @reaction.liked)
          exist_reaction.attributes = { liked: @reaction.liked }
          exist_reaction.save
          render json: {
            status: 'Bool reaction was changed'
          }
        else
          exist_reaction.attributes = { liked: nil }
          exist_reaction.save
          render json: {
            status: 'Change to nil'
          }
        end
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
    @reaction.destroy
    render json: {
      status: :ok,
    }   
  end

  private

  def reaction_params
    params.require(:reaction).permit(:idea_id, :liked)
  end

  def find_customer
    @current_customer = Customer.find(session[:customer_id])
  end
end
