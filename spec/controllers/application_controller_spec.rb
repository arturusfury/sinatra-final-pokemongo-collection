require 'spec_helper'

describe ApplicationController do

  describe 'Homepage' do
    it 'loads the index page for our application' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('The <strong>PokemonGo</strong> Collection')
    end
  end
end
