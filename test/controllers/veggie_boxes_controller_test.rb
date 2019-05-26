require 'test_helper'

class VeggieBoxesControllerTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:joe)
		post login_path, params: { session: { email: @user.email, password: 'password' } }
    @box = veggie_boxes(:box_one)
 	end

	test "should get new" do
		@new_box = VeggieBox.new
		get new_veggie_box_url(@new_box)
		assert_response :success
	end

  test "should get edit" do
    get edit_veggie_box_url(@box.id)
    assert_response :success
  end

end
