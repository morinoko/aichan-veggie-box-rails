class OrdersController < ApplicationController
	# Form for new order is located on the home page, so there is no `new` action

	def create
		@order = Order.new(order_params)

		if @order.save
			OrderMailer.with(order: @order).new_order_email.deliver_later

			flash[:success] = t('flash.order.success')
			redirect_to root_path
		else
			flash.now[:error] = t('flash.order.error_html')
			render 'home/index'
		end
	end

	private

	def order_params
		params.require(:order).permit(:name, :email, :address, :phone, :message)
	end
end
