class GamesController < ApplicationController
  # GET /games
  def index
    @games = Game.all.map { |game| response_attributes(game)  }

    render json: @games
  end

  # GET /games/1
  def show
    @game = response_attributes(Game.find(params[:id]))

    render json: @game
  end

  private
    # Only allow a trusted parameter "white list" through.
    def game_params
      params.permit(:title, :description, :image, :genre)
    end
    
    # Returns only neccesary attributes for Front End
    def response_attributes(game)
      game.attributes.slice('id', 'title', 'description', 'image', 'genre')
    end
end
