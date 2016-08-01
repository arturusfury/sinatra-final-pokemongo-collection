pokedex_num = 1

until pokedex_num > 151 do
  pokemon = HTTParty.get("http://pokeapi.co/api/v1/pokemon/#{pokedex_num}")
  parsed_pokemon_data = JSON.parse(pokemon.body)

  sprite_request_url = parsed_pokemon_data['sprites'].first['resource_uri']
  sprite = HTTParty.get("http://pokeapi.co#{sprite_request_url}")
  parsed_sprite_data = JSON.parse(sprite.body)

  @name = parsed_pokemon_data['name']
  @id = parsed_pokemon_data['national_id']

  if @id.to_i < 10
    @url_id = "00#{@id}"
  elsif @id.to_i < 100
    @url_id = "0#{@id}"
  else
    @url_id = "#{@id}"
  end

  pokemon = Pokemon.create(region: 'Kanto', regional_id: @id, name: @name, image_url: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/#{@url_id}.png")
  pokemon.save

  pokedex_num += 1
end
