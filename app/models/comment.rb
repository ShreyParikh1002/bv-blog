class Comment < ApplicationRecord
	include Visible
	belongs_to :article
	belongs_to :user
	def self.ransackable_associations(auth_object = nil)
		["article"]
	end

	def self.create(params)
		comment = Comment.new(params)
		comment.save!
	end

	def self.ransackable_attributes(auth_object = nil)
		["article_id", "body", "commenter", "created_at", "id", "status", "updated_at", "user_id"]
	end

	def display_name
		commenter
	end
end
