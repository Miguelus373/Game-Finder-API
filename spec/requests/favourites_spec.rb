require 'rails_helper'

RSpec.describe 'Favourites', type: :request do
  describe 'POST /favourites' do
    context 'with valid params' do
      before do
        User.create(username: 'user')
        Game.create(title: 'game', description: 'none', image: 'link', genre: 'fps')
      end

      it 'creates a favourite' do
        post '/favourites', params: { user_id: User.last.id, game_id: Game.last.id }
        expect(JSON.parse(response.body)).not_to be_empty
      end

      it 'returns status code 201' do
        headers = { 'Authorization' => "Basic #{create_token(user_id: User.last.id)}" }

        post '/favourites', params: { user_id: User.last.id, game_id: Game.last.id }, headers: headers
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid params' do
      it 'returns status code 422' do
        headers = { 'Authorization' => "Basic #{create_token(user_id: 35)}" }

        post '/favourites', params: { user_id: 35, game_id: 43 }, headers: headers
        expect(response).to have_http_status(403)
      end

      it 'returns an authorization failure message' do
        headers = { 'Authorization' => "Basic #{create_token(user_id: 27)}" }

        post '/favourites', params: { user_id: 27, game_id: 40 }, headers: headers
        expect(JSON.parse(response.body)['message'])
          .to eq('Error: Couldn\'t find User with \'id\'=27')
      end
    end
  end
end
