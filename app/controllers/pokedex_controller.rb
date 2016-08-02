# Pokedex Controller
class PokedexController < ApplicationController
  get '/pokedex' do
    @pokedex = Pokedex.all
    erb :'pokedex/index'
  end

  get '/pokedex/:id' do
    @pokemon = Pokedex.find(params[:id])

    erb :'pokedex/show'
  end
end
