require 'test_helper'

class OrderTest < ActiveSupport::TestCase

	def setup
  	@order = Order.new(name: "Example User", address: "290 Chuo, Tokyo, 000-8888",
  									 	 phone: "070-9999-000", message: "Please place my order!")
  end

  test "should be valid" do
  	assert @order.valid?
  end

  test "name should be present" do
  	@order.name = ""
  	assert_not @order.valid?
  end

  test "address should be present" do
  	@order.address = ""
  	assert_not @order.valid?
  end

  test "phone should be present" do
  	@order.phone = ""
  	assert_not @order.valid?
  end

  test "message should be present" do
  	@order.message = ""
  	assert_not @order.valid?
  end
end
