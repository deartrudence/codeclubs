class MailingListMailer < ApplicationMailer
  require 'mailgun'
  def list_email(email)
	  @email = email.email
	  mg_client = Mailgun::Client.new ENV['api_key']
	  mail(
	    :to => 'info@teacherslearningcode.com',
	    :subject => 'New Email Subscription'
	    )
	end
end
