require 'test_helper'

class VeggieBoxTest < ActiveSupport::TestCase

	def setup
    @box = VeggieBox.new(title: "Box", description: "Lots of veggies!")
 	end

  test "should be valid" do
    assert @box.valid?
  end

  test "title should be present" do
  	@box.title = ""
  	assert_not @box.valid?
  end

  test "description should be present" do
  	@box.description = ""
  	assert_not @box.valid?
  end

  test "should not be more than one veggie box" do
  	@box.save
  	box_2 = VeggieBox.new(title: "Box 2", description: "invalid box")
  	assert_not box_2.valid?
  end
end
