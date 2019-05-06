require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
  	get root_path
  	assert_response :success
  end

  test "should get home for each locale" do
  	get root_path(locale: :en)
  	assert_response :success
  	get root_path(locale: :ja)
  	assert_response :success
  end

  test "locales should show proper translations" do
  	get root_path(locale: :en)
  	assert_select "h1", "Ai-chan’s Veggie Box"
  	get root_path(locale: :ja)
  	assert_select "h1", "あいちゃんのVeggie Box"
  end
end
