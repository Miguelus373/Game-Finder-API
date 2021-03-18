require 'rails_helper'

RSpec.describe "Games", type: :request do
  describe "GET /games" do
    it "Returns list of games" do
      game1 = Game.create!(title: 'game1', description: 'none', image: 'link', genre: 'fps')
      game2 = Game.create!(title: 'game2', description: 'none', image: 'link', genre: 'fps')

      get games_path
      expect(response.body).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it "returns status code 200" do
      get "/games"
      expect(response).to have_http_status(200)
    end
  end
  
  describe "GET /games/:id" do
    context "with valid params" do
      it "Returns game" do
        game3 = Game.create!(title: 'game3', description: 'none', image: 'link', genre: 'fps')

        get "/games/#{game3.id}"
        expect(response.body).not_to be_empty
        expect(JSON.parse(response.body)['title']).to eq('game3')
      end
    end

    context "with invalid params" do
      it "returns status code 404" do
        get "/games/28"
        expect(response).to have_http_status(404)
      end

      it "returns error message" do
        get "/games/52"
        expect(JSON.parse(response.body)['message'])
          .to match(/Couldn't find Game with 'id'=52/)
      end
    end
  end
end
