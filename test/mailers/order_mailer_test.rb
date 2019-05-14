require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "new order email" do
    order = orders(:one)

		email = OrderMailer.with(order: order).new_order_email

		assert_emails 1 do
			email.deliver_now
		end

		assert_equal ['aichannoveggiebox@gmail.com'], email.from
		assert_equal ['aichannoveggiebox@gmail.com'], email.to
		assert_equal "あいちゃんのベジボックスから新しいメッセージがきました！", email.subject
		assert_match order.name, email.html_part.body.encoded
		assert_match order.name, email.text_part.body.encoded
		assert_match order.email, email.html_part.body.encoded
		assert_match order.email, email.text_part.body.encoded
		assert_match order.address, email.html_part.body.encoded
		assert_match order.address, email.text_part.body.encoded
		assert_match order.phone, email.html_part.body.encoded
		assert_match order.phone, email.text_part.body.encoded
		assert_match order.message, email.html_part.body.encoded
		assert_match order.message, email.text_part.body.encoded
  end
end
