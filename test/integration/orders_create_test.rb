require 'test_helper'

class OrdersCreateTest < ActionDispatch::IntegrationTest
  test "invalid form should not be submitted and errors should be shown" do
    get root_path
    assert_no_difference 'Order.count' do
    	post orders_path, params: { order: { name: "",
    																			 email: "email@invalid",
    																			 address: "",
    																			 phone: "",
    																			 message: "" } }
    end

    assert_template 'home/index'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
end
