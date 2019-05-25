module PostsHelper
	include Pagy::Frontend

	def attribute_errors(object, attribute)
		if object.errors.full_messages_for(attribute.to_sym).any?
			object.errors.full_messages_for(attribute).each do |message| 
				message = "<p class=\"error\">#{message}</p>"
				return message.html_safe
			end
		end
	end
end
