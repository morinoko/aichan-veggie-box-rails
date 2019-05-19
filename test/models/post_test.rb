require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def setup
		@post = posts(:one)
	end

  test "should be valid" do
  	# doesn't work yet
    assert @post.valid?
  end

  test "title should be present" do
  	@post.title = ""
  	assert_not @post.valid?
  end

  test "content should be present" do
  	@post.content = ""
  	assert_not @post.valid?
  end
end
