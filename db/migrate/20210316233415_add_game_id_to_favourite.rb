class AddGameIdToFavourite < ActiveRecord::Migration[6.0]
  def change
    add_reference :favourites, :game, null: false, foreign_key: true
  end
end
