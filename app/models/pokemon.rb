# Pokemon Class
class Pokemon < ActiveRecord::Base
  has_many :user_pokemons
  has_many :user, through: :user_collection
end
