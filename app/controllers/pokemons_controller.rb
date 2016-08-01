class PokemonsController < ApplicationController
  get '/pokemon' do
    erb :'pokemon/index'
  end

  get '/pokemon/:id' do
    erb :'pokemon/show'
  end
end
