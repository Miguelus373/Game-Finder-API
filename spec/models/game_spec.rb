require 'rails_helper'

# Test suite for the Game model
RSpec.describe Game, type: :model do
  # Association test
  # ensure Game model has a 1:m relationship with the Favourites model
  it { should have_many(:favourites).dependent(:destroy) }
  # ensure Game model has a m:m relationship with the User model
  it { should have_many(:users) }
  # Validation tests
  # ensure column title is unique before saving
  it { should validate_uniqueness_of(:title) }
  # ensure columns title, description, image, and genre are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:genre) }
end
