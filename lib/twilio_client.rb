class TwilioClient
	
	def initialize
		account_sid = 'AC86611b222e34764e99236e934b3f3f6d'
		auth_token = '0d4ad0a0c934f1d3e25c4db2f6cf10e6'
		@client = Twilio::REST::Client.new(account_sid, auth_token)
	end

	def send_message
		client.account.sms.messages.create(
		:from => '+443333441016',
		:to => '+447932751950',
		:body => message_confirmation)
	end

end