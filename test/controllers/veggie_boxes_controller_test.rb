require 'test_helper'

class VeggieBoxesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get veggie_boxes_edit_url
    assert_response :success
  end

end
