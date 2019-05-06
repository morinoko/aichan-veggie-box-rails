class HomeController < ApplicationController
	def index
		@order = Order.new
	end
end
