# Pokemon Class
class Pokemon < ActiveRecord::Base
  belongs_to :user
  belongs_to :pokedex
end
