class Game < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  validates_presence_of :title, :description, :image, :genre
end
