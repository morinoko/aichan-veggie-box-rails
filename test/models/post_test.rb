require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def setup
		@post = posts(:one)
    @post.content = action_text_rich_texts(:one)
	end

  test "should be valid" do
    assert @post.valid?
    # check content is actually present
    assert_match "<p>In\ a\ <i>million<\/i>\ stars!<\/p>", @post.content.body.to_s
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
