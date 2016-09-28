class Contact < ApplicationMailer
	def send_form(recipient, data)
		@data = data
		mail( :to => recipient, :subject => 'Contact form')
	end
end