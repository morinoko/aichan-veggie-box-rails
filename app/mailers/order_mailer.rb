class OrderMailer < ApplicationMailer
	def new_order_email
		@order = params[:order]

		mail(to: Rails.application.credentials.admin_email,
				 subject: "あいちゃんのベジボックスから新しいメッセージがきました！")
	end
end
