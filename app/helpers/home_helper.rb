module HomeHelper
	def other_locale
		I18n.locale == :ja ? 'en' : 'ja'
	end
end
