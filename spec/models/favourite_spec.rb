require 'rails_helper'

# Test suite for the Favourite model
RSpec.describe Favourite, type: :model do
  # Association test
  # ensure a Favourite record belongs to a single user record
  it { should belong_to(:user) }
  # ensure a Favourite record belongs to a single game record
  it { should belong_to(:game) }
  # ensure column user_id is present before saving
  it { should validate_presence_of(:user_id) }
  # ensure column game_id is present before saving
  it { should validate_presence_of(:game_id) }
end