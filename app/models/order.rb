class Order < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true
	validates :address, presence: true
	validates :phone, presence: true
	validates :message, presence: true
end
