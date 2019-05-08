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
    assert_select 'div.alert'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "submitting valid form should create a new order" do
    get root_path
    assert_difference 'Order.count', 1 do
        post orders_path, params: { order: { name: "Joe Veggie",
                                             email: "email@example.com",
                                             address: "1-2-3 Chuo, Tokyo, 300-1111",
                                             phone: "09-9999-0000",
                                             message: "Please place my order!" } }
    end

    follow_redirect!
    assert_template 'home/index'
    assert_select 'div.alert-success'
  end
end
