class OrdersController < ApplicationController
	# Form for new order is located on the home page, so there is no `new` action
	before_action :require_login, only: %w{index}

	def index
		@orders = Order.all
		render layout: "admin"
	end

	def create
		@order = Order.new(order_params)

		unless verify_recaptcha?(params[:recaptcha_token], 'order') || Rails.env.test?
			flash.now[:error] = t('recaptcha.errors.verification_failed')
			return render 'home/index'
		end

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
