require 'spec_helper'

describe ApplicationController do

  describe 'Homepage' do
    it 'loads the index page for our application' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('The <strong>PokemonGo</strong> Collection')
    end

    it 'will redirect to the users collection if already logged in' do
      User.create(username: 'skittles123', email: 'skittles@aol.com', password: 'rainbows')
      params = {
        inputUsername: 'skittles123',
        inputPassword: 'rainbows'
      }
      post '/login', params
      expect(last_response.status).to eq(302)
      follow_redirect!
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Current <strong>Collection</strong>')
    end
  end
end
