class FavouritesController < ApplicationController
  # POST /favourites
  def create
    @favourite = Favourite.new(favourite_params)

    if @favourite.save
      render json: @favourite, status: :created, location: @favourite
    else
      render json: @favourite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favourites/1
  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
  end

  private
     # Only allow a trusted parameter "white list" through.
    def favourite_params
      params.permit(:user_id, :game_id)
    end
end
