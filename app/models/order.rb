class Order < ApplicationRecord
	before_save { email.downcase! }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true
	validates :email, presence: true,
										format: { with: VALID_EMAIL_REGEX }
	validates :address, presence: true
	validates :phone, presence: true
	validates :message, presence: true
end
