class User < ActiveRecord::Base
  #TODO: HABTM relationship w/ spots
  #TODO: Look into use of password digest
  has_secure_password
  has_many :spots
end
