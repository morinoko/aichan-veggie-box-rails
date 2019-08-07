class VeggieBox < ApplicationRecord
	validates :title_ja, presence: true
	validates :title_en, presence: true
	validates :description_ja, presence: true
	validates :description_en, presence: true
	validate :only_one
	has_one_attached :photo

	# Defining :method_missing and :respond_to_missing? allows for
	# dynamically determined localized attributed named based
	# on locale so you can use :title, :description, etc.
	# in views instead of :title_en, :description_ja, etc
	def method_missing(method, *args)
		localized_method = "#{method}_#{I18n.locale}"

		if self.respond_to?(localized_method)
			self.send(localized_method)
		else
			super
		end
	end

	def respond_to_missing?(method, *)
		localized_method = "#{method}_#{I18n.locale}"
		self.attribute_names.include?(localized_method) || super
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
