require 'test_helper'

class OrderTest < ActiveSupport::TestCase

	def setup
    @order = orders(:order_1)
  end

  test "should be valid" do
  	assert @order.valid?
  end

  test "name should be present" do
  	@order.name = ""
  	assert_not @order.valid?
  end

  test "email should be present" do
  	@order.email = ""
  	assert_not @order.valid?
  end

  test "email validation should accept valid addresses" do
  	valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
  												first.last@foo.jp alice+bob@baz.cn]

  	valid_addresses.each do |valid_address|
  		@order.email = valid_address
  		assert @order.valid?, "#{valid_address.inspect} should be valid"
  	end
  end

  test "email validation should reject invalid addresses" do
  	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]

    invalid_addresses.each do |invalid_address|
    	@order.email = invalid_address
    	assert_not @order.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be saved as lower-case" do
  	mixed_case_email = "UseR@ExaMple.CoM"
  	@order.email = mixed_case_email
  	@order.save
  	assert_equal mixed_case_email.downcase, @order.reload.email
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
