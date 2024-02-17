ActiveAdmin.register User do
	show do
		attributes_table do
			row :email
			row :created_at
			row :comments do
				link_to "View Comments", admin_article_comments_path("q[user_id_eq]" => resource.id)
			end
			row :articles do
				link_to "View Articles", admin_articles_path("q[user_id_eq]" => resource.id)
			end
		end
	end 
end
