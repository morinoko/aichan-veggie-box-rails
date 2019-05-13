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

  test "login with valid information followed by logout" do
  	# login
  	get login_path
  	post login_path, params: { session: { email: @user.email, password: 'password' } }
  	assert_redirected_to root_path
  	follow_redirect!
  	assert_template 'home/index'
  	assert_not flash.empty?
  	assert_select "div.alert-success", I18n.t('sessions.success')
  	assert_select "a[href=?]", logout_path
  	assert is_logged_in?
  	
  	# logout
  	delete logout_path
  	assert_not is_logged_in?
  	assert_redirected_to root_path
  	follow_redirect!
  	assert_select "div.alert-success", I18n.t('sessions.logout_confirmation')
  	assert_select "a[href=?]", logout_path, count: 0
  end
end
