class ChangeColumnsInAdmin < ActiveRecord::Migration[6.1]
	def change
		add_column :admin_users, :provider, :string
		add_column :admin_users, :uid,      :string
		add_index :admin_users, [:provider, :uid], unique: true

		remove_column :admin_users, :reset_password_token,   :string
		remove_column :admin_users, :reset_password_sent_at, :datetime
		remove_column :admin_users, :remember_sent_at,       :datetime
	end
end
