require 'bcrypt'

class User < ApplicationRecord
	include BCrypt
	has_secure_password
	has_many :articles

	validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
		message: 'must be a valid email address' }
	validates :password_digest, presence: true
end
