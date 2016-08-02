class AddColumnsToPokedex < ActiveRecord::Migration
  def change
    add_column :pokedexes, :height, :string
    add_column :pokedexes, :weight, :string
    add_column :pokedexes, :species, :string
    add_column :pokedexes, :description, :string
    add_column :pokedexes, :types, :string
  end
end
