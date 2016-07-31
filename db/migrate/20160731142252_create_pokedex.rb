# Create the Pokedex
class CreatePokedex < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :national_id
      t.string :region
      t.integer :regional_id
      t.string :name
      t.string :image_url
    end
  end
end
