require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end

    it 'routes to /signup' do
      expect(post: '/signup').to route_to('users#create')
    end
  end
end
