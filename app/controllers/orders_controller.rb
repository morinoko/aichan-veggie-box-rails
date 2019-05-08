class OrdersController < ApplicationController
	def create
		@order = Order.new(order_params)

		if @order.save
			redirect_to root_path
		else
			render 'home/index'
		end
	end

	private

	def order_params
		params.require(:order).permit(:name, :email, :address, :phone, :message)
	end
end
