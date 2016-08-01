# This seed file takes a little bit of time because it pulls information off of
# the PokeAPI database, so parsing out 151 pokemon by API and assigning their
# values isn't always the fastest way. This takes a little bit of time to seed,
# but it saves a lot of extra API calls later in the code that we don't need
pokedex_num = 1

until pokedex_num > 151
  pokemon = HTTParty.get("http://pokeapi.co/api/v1/pokemon/#{pokedex_num}")
  parsed_pokemon_data = JSON.parse(pokemon.body)

  @name = parsed_pokemon_data['name']
  @id = parsed_pokemon_data['national_id']

  if @id.to_i < 10
    @url_id = "00#{@id}"
  elsif @id.to_i < 100
    @url_id = "0#{@id}"
  else
    @url_id = "#{@id}"
  end

  pokemon = Pokedex.create(region: 'Kanto', regional_id: @id, name: @name, image_url: "http://assets.pokemon.com/assets/cms2/img/pokedex/full/#{@url_id}.png")
  pokemon.save

  pokedex_num += 1
end

User.create(username: 'brian', password: 'password', email: 'home@email.com')
User.create(username: 'kim', password: 'password', email: 'home@email.com')
User.create(username: 'sam', password: 'password', email: 'home@email.com')

Pokemon.create(user_id: 1, pokedex_id: 1, cp: 259)
Pokemon.create(user_id: 1, pokedex_id: 123, cp: 343)
Pokemon.create(user_id: 1, pokedex_id: 48, cp: 589)
Pokemon.create(user_id: 1, pokedex_id: 56, cp: 10)
Pokemon.create(user_id: 1, pokedex_id: 17, cp: 1239)
Pokemon.create(user_id: 1, pokedex_id: 149, cp: 2345)
Pokemon.create(user_id: 1, pokedex_id: 111, cp: 15)
