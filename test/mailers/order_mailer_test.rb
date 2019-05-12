require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "new order email" do
    order = Order.new(name: "Joe Smith", email: "joe@gmail.com",
    									address: "1-2-3 Chuo, Tokyo, 333-0000", phone: "090-7777-8888",
    									message: "I want to place an order!")

		email = OrderMailer.with(order: order).new_order_email

		assert_emails 1 do
			email.deliver_now
		end

		assert_equal ['aichannoveggiebox@gmail.com'], email.from
		assert_equal ['aichannoveggiebox@gmail.com'], email.to
		assert_equal "あいちゃんのベジボックスから新しいメッセージがきました！", email.subject
  end
end
