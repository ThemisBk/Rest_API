class ApplicationController < ActionController::API
  before_action :authenticate_user
  
  private
  
  def authenticate_user
    user_id = request.headers['X-User-Id']
    @current_user = User.find_by(id: user_id)
    
    unless @current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end