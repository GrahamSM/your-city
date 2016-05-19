class User < ActiveRecord::Base
  #TODO: HABTM relationship w/ spots
  #TODO: Look into use of password digest
  has_many :spots
  validates :username, uniqueness:true, presence: true
  validates :email, uniqueness:true, presence: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates :password, length:{minimum: 4}
  has_secure_password
end
