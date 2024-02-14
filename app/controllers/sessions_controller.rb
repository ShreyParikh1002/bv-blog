class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to @user
		else  
			redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path
	end

	def show
		if session[:user_id] == nil
			redirect_to login_path
		else
			@user = User.find(session[:user_id])
			redirect_to @user
		end
	end
end
