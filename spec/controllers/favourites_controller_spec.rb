require 'rails_helper'

RSpec.describe FavouritesController, type: :controller do
  before {
    User.create(username: 'user')
    Game.create(title: 'game3', description: 'none', image: 'link', genre: 'fps')
  }
  
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Favourite" do
        expect {
          post :create, params: {user_id: User.last.id, game_id: Game.last.id}
        }.to change(Favourite, :count).by(1)
      end

      it "renders a JSON response with the new favourite" do
        post :create, params: {user_id: User.last.id, game_id: Game.last.id}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.location).to eq(favourite_url(Favourite.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new favourite" do

        post :create, params: {user_id: 37, game_id: 55}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested favourite" do
      favourite = Favourite.create(user_id: User.last.id, game_id: Game.last.id)
      expect {
        delete :destroy, params: {id: favourite.to_param}
      }.to change(Favourite, :count).by(-1)
    end
  end

end
