class AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: :login

  def login
    @user = User.find_by(username: auth_params[:username])

    if @user
      payload = { user_id: @user.id }

      token = create_token(payload)

      render json: { username: @user.username, token: token }
    else
      render json: { message: 'Could not find user' }
    end
  end

  private

  def auth_params
    params.permit(:username)
  end
end
