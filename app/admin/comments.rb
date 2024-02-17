ActiveAdmin.register Comment, :as => "ArticleComment" do
	actions :index, :edit, :update, :create, :destroy
	permit_params :commenter, :body, :article_id, :status
	filter :article_id, label: 'article_id'
	filter :user_id, label: 'user_id'
end
