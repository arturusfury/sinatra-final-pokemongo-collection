# User Pokemons
class UserPokemons < ActiveRecord::Base
  belongs_to :pokemon
  belongs_to :user
end
