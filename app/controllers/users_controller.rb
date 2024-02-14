class UsersController < ApplicationController
	def index
		@articles = Article.all
	end

	def new 
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.valid?
			@user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
			render :new, status: :unprocessable_entity
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:email, :password)
	end
end
