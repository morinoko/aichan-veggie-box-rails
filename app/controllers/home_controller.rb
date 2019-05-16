class HomeController < ApplicationController
	def index
		@order = Order.new
		@veggie_box = VeggieBox.first
	end
end
