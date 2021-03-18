class User < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :games, through: :favourites

  validates :username, presence: true, uniqueness: true

  def as_json(_option = {})
    super(only: %i[id username])
  end
end
