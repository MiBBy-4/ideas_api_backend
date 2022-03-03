class Api::V1::IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :update, :destroy]

  def index
    @ideas = Idea.where("publication_period >= :date", date: today)
    render json: @ideas.to_json(include: [:customer, :reactions])
  end

  def show
    if @date.publication_period >= today   
      render json: @idea.to_json(include: [:customer, :reactions])
    else
      render json: {
        status: 403,
        message: "Sorry, but Idea is unavailable"
      }
    end
  end

  def create
    customer_id = session[:customer_id]
    @idea = Idea.new(idea_params)
    @idea.publication_period = today + 30

    if @idea.save
      render json: {
        errors: @idea, status: 201,
        location: api_v1_ideas_path(@idea)
      } 
    else
      render json: {
        erorrs: @idea.errors,
        status: 422
      }
    end
  end

  def update
    if @idea.update(idea_params)
      render json: @idea
    else
      render json: {
        erorrs: @idea.errors,
        status: 422
      }
    end
  end

  def destroy
    @idea.destroy
  end

  private

    def today
      today = Date.today
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:name, :description, :problem, :sphere, :investor_requirements, :geo_focus, :customer_id, :views)
    end
end
