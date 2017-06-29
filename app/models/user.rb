require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password_set, Text

def password=(password)
  self.password_set = Password.create(password)
end
end 
