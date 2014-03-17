DISHES = {noodles: 5.99, drink: 1.50, cheese: 3.49}
MYORDER = {noodles: 1, drink: 2, cheese: 0}
require 'bundler/setup'
require "twilio-ruby"


class Takeaway

	attr_accessor :dishes
	attr_accessor :order


	def initialize(twilioClient)
		@order = MYORDER
		@dishes = DISHES
		@twilioClient = twilioClient
	end


	def order_total(order, order_sum)
		total = @order.inject(0) do |total, item|
			dish, quantity = item #item will be an array
			total = total + (@dishes[dish] * quantity) # 5.99 * 1
		end
		total
		order_sum != total ? (raise "The total appears to be incorrect") : @twilioClient.send_message(message_confirmation)
	end

	def message_confirmation
		time = Time.now + (60*60)
		"Thank you! Your order was placed successfully and that it will be delivered before #{time.strftime("%H%M")}"
	end

end
