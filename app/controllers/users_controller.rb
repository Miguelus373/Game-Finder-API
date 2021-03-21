class UsersController < ApplicationController
  skip_before_action :authenticate, only: :create

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @favs = @user.favourites.map { |fav| { id: fav.id, game_id: fav.game_id } }

    render json: { info: @user, favs: @favs }
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      payload = { user_id: @user.id }

      token = create_token(payload)

      response = { user: @user, token: token }

      render json: response, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:username)
  end
end
