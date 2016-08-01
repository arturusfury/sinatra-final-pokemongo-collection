# Pokemons Controller
class PokemonsController < ApplicationController
  get '/pokedex' do
    @pokemons = Pokemon.all
    erb :'pokemons/index'
  end

  get '/pokedex/:id' do
    @pokemon = Pokemon.find(params[:id])

    poke_loader = Poke::API::Loader.new('pokemon')
    parsed_pokemon_data = poke_loader.find(params[:id])

    @height = parsed_pokemon_data['height']
    @weight = parsed_pokemon_data['weight']
    @species = parsed_pokemon_data['species']
    @types = parsed_pokemon_data['types'].map { |type_data| type_data['name'] }

    description_id = parsed_pokemon_data['descriptions'].first["resource_uri"].gsub('/api/v1/description/', '').gsub('/','')

    desc_loader = Poke::API::Loader.new('description')
    parsed_description_data = desc_loader.find(description_id.to_i)

    @description = parsed_description_data['description']

    if @pokemon.id < 10
      @url_id = "00#{@pokemon.id}"
    elsif @pokemon.id < 100
      @url_id = "0#{@pokemon.id}"
    else
      @url_id = @pokemon.id.to_s
    end

    erb :'pokemons/show'
  end
end
