class User < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :games, through: :favourites

  validates :username, presence: true, uniqueness: true
end
