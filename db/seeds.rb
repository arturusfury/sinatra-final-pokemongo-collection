# This seed file takes a little bit of time because it pulls information off of
# the PokeAPI database, so parsing out 151 pokemon by API and assigning their
# values isn't always the fastest way. This takes a little bit of time to seed,
# but it saves a lot of extra API calls later in the code that we don't need
pokedex_num = 1

until pokedex_num > 151
  poke_loader = Poke::API::Loader.new('pokemon')
  parsed_pokemon_data = poke_loader.find(pokedex_num)

  id = parsed_pokemon_data['national_id']

  if id.to_i < 10
    url_id = "00#{id}"
  elsif id.to_i < 100
    url_id = "0#{id}"
  else
    url_id = "#{id}"
  end

  description_id = parsed_pokemon_data['descriptions'].first['resource_uri']
  description_id.gsub!('/api/v1/description/', '').gsub!('/','')

  desc_loader = Poke::API::Loader.new('description')
  parsed_description_data = desc_loader.find(description_id.to_i)

  pokemon_data = {
    name: parsed_pokemon_data['name'],
    region: 'Kanto',
    regional_id: parsed_pokemon_data['pkdx_id'],
    height: parsed_pokemon_data['height'],
    weight: parsed_pokemon_data['weight'],
    species: parsed_pokemon_data['species'],
    image_url: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/#{url_id}.png",
    description: parsed_description_data['description'],
    types: parsed_pokemon_data['types'].map { |type_data| type_data['name'] }.join(',')
  }

  pokemon = Pokedex.create(pokemon_data)
  pokemon.save

  pokedex_num += 1
end
