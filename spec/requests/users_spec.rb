require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/:id' do
    context 'with valid params' do
      it 'Returns user' do
        user = User.create(username: 'Her')
        get "/users/#{user.id}"
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['username']).to eq('Her')
      end

      it 'returns status code 200' do
        user = User.create(username: 'Me')
        get "/users/#{user.id}"
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid params' do
      it 'returns status code 404' do
        get '/users/47'
        expect(response).to have_http_status(404)
      end

      it 'returns error message' do
        get '/users/36'
        expect(JSON.parse(response.body)['message'])
          .to match(/Couldn't find User with 'id'=36/)
      end
    end
  end

  describe 'POST /users' do
    context 'with valid params' do
      before { post '/users', params: { username: 'Hello' } }

      it 'creates a user' do
        expect(JSON.parse(response.body)['username']).to eq('Hello')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid params' do
      before { post '/users', params: { username: ' ' } }

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
