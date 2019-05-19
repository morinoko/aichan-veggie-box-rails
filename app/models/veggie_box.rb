class VeggieBox < ApplicationRecord
	validates :title_ja, presence: true
	validates :title_en, presence: true
	validates :description_en, presence: true
	validates :description_en, presence: true
	validate :only_one
	has_one_attached :photo

	def localized_title
		self.send("title_#{I18n.locale}")
	end

	def localized_description
		self.send("description_#{I18n.locale}")
	end

	def thumbnail
		self.photo.variant(resize_to_limit: [100, 100])
	end

	private

	def only_one
		if VeggieBox.count >= 1  && self != VeggieBox.first
			errors.add :base, 'There can only be one Veggie Box'
		end
	end
end
