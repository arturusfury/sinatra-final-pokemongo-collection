# Create the Pokedex
class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.integer :national_id
      t.string :region
      t.integer :regional_id
      t.string :name
      t.string :image_url
    end
  end
end
