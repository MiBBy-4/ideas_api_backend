class MembersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    user = user_from_token
    render json: {
      message: "If you see this, you're in",
      user: user
    }
  end

  private
  def user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.devise[:jwt_secret_key]).first
    user_id = jwt_payload['sub']
    user = User.find(user_id.to_s)
  end
end
