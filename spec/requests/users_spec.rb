require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/:id' do
    context 'with valid params' do
      it 'Returns user' do
        user = User.create(username: 'Her')
        headers = { 'Authorization' => "Basic #{create_token(user_id: user.id)}" }

        get "/users/#{user.id}", headers: headers
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['info']['username']).to eq('Her')
      end

      it 'returns status code 200' do
        user = User.create(username: 'Me')
        headers = { 'Authorization' => "Basic #{create_token(user_id: user.id)}" }

        get "/users/#{user.id}", headers: headers
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid params' do
      it 'returns status code 404' do
        get '/users/47'
        expect(response).to have_http_status(403)
      end

      it 'returns error message' do
        get '/users/36'
        expect(JSON.parse(response.body)['message'])
          .to match(/No Authorization header was sent/)
      end
    end
  end

  describe 'POST /signup' do
    context 'with valid params' do
      before { post '/signup', params: { username: 'Hello' } }

      it 'creates a user' do
        expect(JSON.parse(response.body)['user_id']).to eq(User.last.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid params' do
      before { post '/signup', params: { username: ' ' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(JSON.parse(response.body)['username'])
          .to eq(["can't be blank"])
      end
    end
  end
end
