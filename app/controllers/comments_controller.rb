class CommentsController < ApplicationController
	before_action :load_article, except: [:new, :create, :error_page]

	def load_article
		@article = Article.find_by(id: params[:id])
		if @article.nil?
			flash[:alert] = "Article doesn't exist"
			redirect_to error_path
		end
	end

	def load_comment
		comment = @article.comments.find_by(params[:id])
		if comment.nil?
			flash[:alert] = "Comment doesn't exist"
			redirect_to error_path
		end
	end

	def create
		comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
		redirect_to article_path(@article)
	end

	def destroy
		comment.destroy
		redirect_to article_path(@article)
	end

	private
	def comment_params
		params.require(:comment).permit(:commenter, :body, :status)
	end
end
