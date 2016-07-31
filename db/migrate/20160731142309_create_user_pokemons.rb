# Create the User Pokemons table
class CreateUserPokemons < ActiveRecord::Migration
  def change
    create_table :user_pokemons do |t|
      t.integer :user_id
      t.integer :national_id
      t.integer :cp
    end
  end
end
