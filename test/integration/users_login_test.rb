require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:joe)
	end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
    assert_not is_logged_in?
  end

  test "login with valid information" do
  	get login_path
  	post login_path, params: { session: { email: @user.email, password: 'password' } }
  	assert_redirected_to root_path
  	follow_redirect!
  	assert_template 'home/index'
  	assert_not flash.empty?
  	assert_select "div.alert-success", I18n.t('sessions.success')
  	assert is_logged_in?
  end
end
