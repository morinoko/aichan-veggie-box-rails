class VeggieBox < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	validate :only_one
	has_one_attached :photo

	private

	def only_one
		if VeggieBox.count >= 1  && self != VeggieBox.first
			errors.add :base, 'There can only be one Veggie Box'
		end
	end
end
