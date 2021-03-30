require 'rails_helper'

# Test suite for the User model
RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the Favourites model
  it { should have_many(:favourites).dependent(:destroy) }
  # ensure User model has a m:m relationship with the Game model
  it { should have_many(:games) }
  # Validation tests
  # ensure column username is present before saving
  it { should validate_presence_of(:username) }
  # ensure column username is unique before saving
  it { should validate_uniqueness_of(:username) }
end
