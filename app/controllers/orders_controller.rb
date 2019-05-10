class OrdersController < ApplicationController
	def create
		@order = Order.new(order_params)

		if @order.save
			flash.now[:success] = t('flash.order.success')
			OrderMailer.with(order: @order).new_order_email.deliver_now
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
