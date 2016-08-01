# Create the Pokedex
class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.integer :user_id
      t.integer :pokedex_id
      t.integer :cp
    end
  end
end
