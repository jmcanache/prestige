class Notifier < ApplicationMailer
	def send_booking_request(recipient, gretings, booking_data)
		@booking_data = booking_data
		@gretings = gretings

		mail( :to => recipient, :subject => 'New booking request')
	end
end
