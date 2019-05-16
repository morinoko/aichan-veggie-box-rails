require 'test_helper'

class VeggieBoxTest < ActiveSupport::TestCase

	def setup
    @box = veggie_boxes(:box_one)
 	end

  test "should be valid" do
    assert @box.valid?
  end

  test "title should be present" do
  	@box.title_ja = ""
  	assert_not @box.valid?
  end

  test "description should be present" do
  	@box.description_en = ""
  	assert_not @box.valid?
  end

  test "should not be more than one veggie box" do
  	box_2 = VeggieBox.new(title_ja: "Box 2", description_ja: "invalid box",
                          title_en: "Box 2", description_en: "invalid box")
  	assert_not box_2.valid?
  end
end
