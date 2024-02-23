class ArticlesController < ApplicationController
	before_action :load_user, except: [:show, :error_page]
	before_action :load_article, except: [:new, :create, :error_page]
	before_action :owner?, only: [:update, :destroy, :edit]

	def show
	end

	def new
		@article = Article.new
	end

	def create
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
		if @article.update!(article_params)
			redirect_to article_path(@article)
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@article.destroy!
		redirect_to @user
	end

	def error_page
	end

	private
	def article_params
		params.require(:article).permit(:title, :body, :status)
	end

	def load_article
		@article = Article.find_by(id: params[:id])
		if @article.nil?
			flash[:alert] = "Article doesnt exist"
			redirect_to error_path
		end
	end

	def load_user
		@user = current_user
		if nil == @user
			redirect_to new_user_session_path
		end
	end

	def owner?
		if @article.user_id != @user.id
			flash[:alert] = "You are not the owner of this article."
			redirect_to error_path
		end
	end
end
