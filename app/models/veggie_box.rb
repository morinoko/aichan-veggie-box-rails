class VeggieBox < ApplicationRecord
	validates :title_ja, presence: true
	validates :title_en, presence: true
	validates :description_ja, presence: true
	validates :description_en, presence: true
	validate :only_one
	has_one_attached :photo

	# Allows for dynamically determined localized title and description based on locale
	def method_missing(method, *args)
		if method == "description" || "title"
			localized_method = "#{method}_#{I18n.locale}"
			self.send(localized_method)
		else
			super
		end
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
