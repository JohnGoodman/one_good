class InformationMailer < ActionMailer::Base
  default from: "One Good Samaritan <info@one-good-samaritan.com>"

  def send_help_offer_notification(help_offer)
    to = help_offer.receiving_user.email_name
    from_user = help_offer.user
    @message = from_user.name + " has offered to help you. View the offer: " + need_url(help_offer.need)
    subject = 'New Offer to Help'

    if Rails.env.development?
      subject = '[' + to + '] ' + subject
      to = 'jgoodman09@gmail.com, aj_nykamp@hotmail.com' 
    end

    mail(:to => to, :subject => subject)
  end

  def accept_help_offer(to, message)
  	@message = message
  	subject = 'Help Offer Accepted'

  	if Rails.env.development?
  		subject = '[' + to.join(', ') + '] ' + subject
 	  	to = 'jgoodman09@gmail.com, aj_nykamp@hotmail.com' 
	  end

  	mail(:to => to, :subject => subject)
  end

  def decline_help_offer(to, message)
  	@message = message
  	subject = 'Help Offer Declined'

  	if Rails.env.development?
  		subject = '[' + to + '] ' + subject
 	  	to = 'jgoodman09@gmail.com, aj_nykamp@hotmail.com' 
	  end

  	mail(:to => to, :subject => subject)
  end

end
