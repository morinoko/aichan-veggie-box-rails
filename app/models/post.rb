class Post < ApplicationRecord
	has_rich_text :content
	validates :title, presence: true
	validates :content, presence: true
end
