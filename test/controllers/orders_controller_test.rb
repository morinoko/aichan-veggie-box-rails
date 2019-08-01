require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:joe)
		post login_path, params: { session: { email: @user.email, password: 'password' } }
 	end

  test "should get orders index" do
    get orders_path
    assert_response :success
  end

  test "should not show index page if logged out" do
  	delete logout_path
  	get orders_path
    assert_redirected_to root_path
	end
end
