class CreatePokedex < ActiveRecord::Migration
  def change
    create_table :pokedexes do |t|
      t.string :region
      t.integer :regional_id
      t.string :name
      t.string :image_url
    end
  end
end
