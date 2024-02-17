class Article < ApplicationRecord
	include Visible

	belongs_to :user
	has_many :comments, dependent: :destroy

	def self.ransackable_associations(auth_object = nil)
		["comments", "user"]
	end

	def self.ransackable_attributes(auth_object = nil)
		["body", "created_at", "id", "status", "title", "updated_at", "user_id"]
	end

	validates :title, presence: true
	validates :body, presence: true, length: { minimum: 10 }
end
