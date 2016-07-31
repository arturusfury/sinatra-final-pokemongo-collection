# User Class
class User < ActiveRecord::Base
  has_many :user_collection
  has_many :pokemon, through: :user_collection

  has_secure_password
end
