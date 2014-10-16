class InformationMailer < ActionMailer::Base
  default from: "info@one-good-samaritan.com"

  def accept_help_offer(to, message)
  	@message = message

  	to = 'jgoodman09@gmail.com' if Rails.env.development?
  	mail(:to => to, :subject => 'Help Offer Accepted')
  end

  def decline_help_offer(to, message)
  	@message = message

  	to = 'jgoodman09@gmail.com' if Rails.env.development?
  	mail(:to => to, :subject => 'Help Offer Declined')
  end

end
