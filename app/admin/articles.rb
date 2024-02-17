ActiveAdmin.register Article do
	actions :show, :index, :destroy
	permit_params :title, :body, :status, :user_id
	filter :user_id, label: 'id'
	filter :user_email, label: 'email', as: :string
	show do
		attributes_table do
			row :title
			row :body
			row :status
			row :user
			row :comments do
				link_to "View Comments", admin_article_comments_path("q[article_id_eq]" => resource.id)
			end
		end
	end
end
