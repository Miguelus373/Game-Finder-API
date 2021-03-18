class User < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :games, through: :favourites

  validates :username, presence: true, uniqueness: true

  def as_json(option={})
    super(only: [:id, :username])
  end
end
