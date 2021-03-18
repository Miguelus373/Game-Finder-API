class GamesController < ApplicationController
  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    @game = Game.find(params[:id])

    render json: @game
  end

  private

  # Only allow a trusted parameter "white list" through.
  def game_params
    params.permit(:title, :description, :image, :genre)
  end
end
