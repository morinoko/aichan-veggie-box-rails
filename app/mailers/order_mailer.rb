class OrderMailer < ApplicationMailer
	def new_order_email
		@name = params[:name]
		@email = params[:email]
		@address = params[:address]
		@phone = params[:phone]
		@message = params[:message]

		mail(to: ADMIN_EMAIL, subject: "あいちゃんのベジボックスから新しいメッセージがきました！")
	end
end
