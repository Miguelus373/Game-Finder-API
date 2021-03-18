require 'rails_helper'

RSpec.describe "Favourites", type: :request do
  describe "POST /favourites" do
    context 'with valid params' do
      before { 
        User.create(username: 'user')
        Game.create(title: 'game', description: 'none', image: 'link', genre: 'fps')
      }

      it 'creates a favourite' do
        post '/favourites', params: { user_id: User.last.id, game_id: Game.last.id}
        expect(JSON.parse(response.body)).not_to be_empty
      end

      it 'returns status code 201' do
        post '/favourites', params: { user_id: User.last.id, game_id: Game.last.id}
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid params' do
      it 'returns status code 422' do
        post '/favourites', params: { user_id: 35, game_id: 43 }
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        post '/favourites', params: { user_id: 27, game_id: 40 }
        expect(JSON.parse(response.body)['user'])
          .to eq(["must exist"])
        expect(JSON.parse(response.body)['game'])
          .to eq(["must exist"])
      end
    end
  end
end
