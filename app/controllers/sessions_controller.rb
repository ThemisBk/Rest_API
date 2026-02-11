class SessionsController < ApplicationController
  skip_before_action :authenticate_user
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]
      render json: { id: user.id, email: user.email }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
  
  def destroy
    render json: { message: 'Logged out successfully' }
  end
end