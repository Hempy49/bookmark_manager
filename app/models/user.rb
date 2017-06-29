require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password_set, Text
  attr_accessor :confirm_password

  validates_confirmation_of :password, :confirm => :confirm_password

def password=(password)
  self.password_set = Password.create(password)
end
end
