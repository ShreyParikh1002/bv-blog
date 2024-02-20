ActiveAdmin.register Article do
	actions :show, :index, :destroy
	permit_params :title, :body, :status, :user_id
	filter :user_id, label: 'user_id'
	filter :user_email, label: 'user_email', as: :string
	filter :id, label: 'article_id'
	filter :created_at
	index do
		id_column
		column :title
		column :user
		column :created_at
		column :updated_at
		actions
	end
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
