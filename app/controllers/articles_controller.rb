class ArticlesController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def index
		@articles = Article.all
  end

	def show
		@article = Article.find_by(id: params[:id])
		if @article.nil?
			redirect_to error_path
		end
  end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
	end
	
	def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to root_path
	end
  
	def mydelete
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to root_path
	end

	def error_page
	end

	private
		def article_params
			params.require(:article).permit(:title, :body, :status)
		end

end
