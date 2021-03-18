require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe "GET #index" do
    it "returns a success response" do
      game = Game.create!(title: 'game', description: 'none', image: 'link', genre: 'fps')
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      game = Game.create!(title: 'game', description: 'none', image: 'link', genre: 'fps')
      get :show, params: {id: game.id}
      expect(response).to be_successful
    end
  end

end
