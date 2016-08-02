# Pokedex Controller
class PokedexController < ApplicationController
  get '/pokedex' do
    @pokedex = Pokedex.all
    erb :'pokedex/index'
  end

  get '/pokedex/:id' do
    @pokemon = Pokedex.find(params[:id])

    poke_loader = Poke::API::Loader.new('pokemon')
    parsed_pokemon_data = poke_loader.find(@pokemon.id)

    @height = parsed_pokemon_data['height']
    @weight = parsed_pokemon_data['weight']
    @species = parsed_pokemon_data['species']
    @types = parsed_pokemon_data['types'].map { |type_data| type_data['name'] }

    description_id = parsed_pokemon_data['descriptions'].first['resource_uri']
    description_id.gsub!('/api/v1/description/', '').gsub!('/','')

    desc_loader = Poke::API::Loader.new('description')
    parsed_description_data = desc_loader.find(description_id.to_i)

    @description = parsed_description_data['description']

    erb :'pokedex/show'
  end
end
