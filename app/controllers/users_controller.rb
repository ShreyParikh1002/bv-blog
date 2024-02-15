class UsersController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@user = User.find_by(id: params[:id])
		if @user.nil?
      redirect_to error_path
    end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password)
	end
end
