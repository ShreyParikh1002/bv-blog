class ArticlesController < ApplicationController
	before_action :pre_processing, only: [:update, :destroy, :edit]
	before_action :owner?, only: [:update, :destroy, :edit]
	before_action :authorized, only: [:new, :create]

	def pre_processing
		@user = User.find_by(id: session[:user_id])
		if nil == @user
			redirect_to login_path
		end
		@article = Article.find_by(id: params[:id])
	end

	def owner?
		if @article.user_id != session[:user_id]
			redirect_to error_path
		end
	end

	def show
		@article = Article.find_by(id: params[:id])
		if @article.nil?
			redirect_to error_path
		end
	end

	def new
		@user = User.find(session[:user_id])
		@article = Article.new
	end

	def create
		@user = User.find(session[:user_id])
		@article = @user.articles.create(article_params)
		if @article.save
			redirect_to user_path(@user)
		else
			puts "Article errors: #{@article.errors}"
			render :new, status: :unprocessable_entity
		end
	end

	def edit
	end

	def update
		if @article.update(article_params)
			redirect_to user_article_path(@user, @article)
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@article.destroy
		redirect_to @user
	end

	def error_page
	end

	private
	def article_params
		params.require(:article).permit(:title, :body, :status)
	end

end
