class AdminUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all
		admin_user = AdminUser.from_omniauth(auth_hash)

		if admin_user.persisted?
			flash.notice = "Signed in!"
			sign_in_and_redirect admin_user
		else
			flash.notice = "We couldn't sign you in because: " + admin_user.errors.full_messages.to_sentence
			redirect_to new_admin_user_session_url
		end
	end

	alias_method :google_oauth2, :all

	private
	def auth_hash
		request.env["omniauth.auth"]
	end
end
