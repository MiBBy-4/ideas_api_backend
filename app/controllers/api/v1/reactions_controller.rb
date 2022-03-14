class Api::V1::ReactionsController < ApplicationController
  respond_to :json
  before_action :find_customer

  def create
    @reaction = @current_customer.reactions.new(reaction_params)
    idea_id = @reaction.idea_id
    if Reaction.exists?(customer_id: @current_customer.id, idea_id: idea_id)
      exist_reaction = Reaction.where(customer_id: @current_customer.id, idea_id: idea_id).last
      if exist_reaction.liked.nil?
        exist_reaction.attributes = { liked: @reaction.liked }
        exist_reaction.save
        render json: {
          status: 200,
          reaction: exist_reaction,
        }
      else
        if (exist_reaction.liked && !@reaction.liked) || (!exist_reaction.liked && @reaction.liked)
          exist_reaction.attributes = { liked: @reaction.liked }
          exist_reaction.save
          render json: {
            status: 200,
            reaction: exist_reaction,
          }
        elsif (exist_reaction.liked && @reaction.liked) || (!exist_reaction.liked && !@reaction.liked)
          exist_reaction.attributes = { liked: nil }
          exist_reaction.save
          render json: {
            status: 200,
            reaction: exist_reaction,
          }
        end
      end
    else
      if @reaction.save
        render json: {
          status: 200,
          reaction: @reaction,
        }
      else
        render json: {
          status: 422,
          erorrs: @reaction.errors.full_messages
        }
      end
    end
    
  end

  def destroy
    @reaction = @current_customer.reactions.find(params[:id])
    @reaction.destroy
    render json: {
      status: 200,
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
