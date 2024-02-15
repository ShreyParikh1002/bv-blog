class CreateComments < ActiveRecord::Migration[6.1]
	def change
		create_table :comments do |t|
			t.string :commenter
			t.text :body
			t.timestamps
			t.references :article, null: false, foreign_key: true
		end
	end
end
