class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :validatable

	has_many :articles
	has_many :comments

	def self.ransackable_associations(auth_object = nil)
		["articles"]
	end

	def self.ransackable_attributes(auth_object = nil)
		["created_at", "email", "encrypted_password", "id", "password_digest", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at", "comments_id"]
	end

	def display_name
		email
	end
end
