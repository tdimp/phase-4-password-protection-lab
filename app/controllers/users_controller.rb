class UsersController < ApplicationController
  
  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.user_id
      render json: user, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(username: session[:username])
    if user

    else
  end

  private

  def user_params
    params.permit(username, password_digest)
  end

end
