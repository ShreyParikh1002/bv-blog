class AdminUser < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, 
		:recoverable, :rememberable, :validatable, :omniauthable
	def self.ransackable_attributes(auth_object = nil)
		["created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
	end

	with_options presence: true do
		validates :email
		validates :provider
		validates :uid, uniqueness: { scope: :provider }
	end

	def password_required?
		return false if provider.present?
		super
	end

	class << self
		def from_omniauth(auth)
			admin_user = where(email: auth.info.email).first_or_initialize do |user|
				user.provider = auth.provider
				user.uid = auth.uid
				user.email = auth.info.email
			end

			admin_user.save if admin_user.new_record?
			admin_user	
		end
	end
end
