class InformationMailer < ActionMailer::Base
  default from: "One Good Samaritan <info@one-good-samaritan.com>"

  def accept_help_offer(to, message)
  	@message = message
  	subject = 'Help Offer Accepted'

  	if Rails.env.development?
  		subject = '[' + to.join(', ') + '] ' + subject
 	  	to = 'jgoodman09@gmail.com' 
	  end

  	mail(:to => to, :subject => subject)
  end

  def decline_help_offer(to, message)
  	@message = message
  	subject = 'Help Offer Declined'

  	if Rails.env.development?
  		subject = '[' + to + '] ' + subject
 	  	to = 'jgoodman09@gmail.com' 
	  end

  	mail(:to => to, :subject => subject)
  end

end
