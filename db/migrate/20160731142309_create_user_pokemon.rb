# Create the User Collection
class CreateUserCollection < ActiveRecord::Migration
  def change
    create_table :user_pokemons do |t|
      t.integer :user_id
      t.integer :national_id
      t.integer :cp
    end
  end
end
