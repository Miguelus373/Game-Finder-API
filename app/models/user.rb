class User < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :games, through: :favourites

  validates_presence_of :username
end
