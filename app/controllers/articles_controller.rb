class ArticlesController < ApplicationController
	before_action :pre_processing, only: [:update, :destroy, :edit]
	before_action :owner?, only: [:update, :destroy, :edit]
	before_action :authenticate_user!, only: [:new, :create]

	def pre_processing
		@user = current_user
		if nil == @user
			redirect_to new_user_session_path
		end
		@article = Article.find_by(id: params[:id])
	end

	def owner?
		if @article.user_id != current_user.id
			flash[:alert] = "You are not the owner of this article."
			redirect_to error_path
		end
	end

	def show
		@article = Article.find_by(id: params[:id])
		if @article.nil?
			flash[:alert] = "Article doesnt exist"
			redirect_to error_path
		end
	end

	def new
		@user = current_user
		@article = Article.new
	end

	def create
		@user = current_user
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
