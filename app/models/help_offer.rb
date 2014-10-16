class HelpOffer < ActiveRecord::Base
	belongs_to :need
  belongs_to :user
  belongs_to :receiving_user, class_name: 'User'

  validates :help_message, presence: true

  def creator_name
    user.try(:name).to_s
  end

  def reciever_name
    receiving_user.try(:name).to_s
  end

  def pending? 
    status == 'pending'
  end

  def accepted? 
    status == 'accepted'
  end

  def declined? 
    status == 'declined'
  end

  def accept_help_offer
    # Send email putting in place the contact info
    to = [user.email_name, receiving_user.email_name]
    message = accept_message
    InformationMailer.accept_help_offer(to, message).deliver
  end

  def decline_help_offer
    # Send email to user with the decline message
    to = user.email_name
    message = accept_message
    InformationMailer.decline_help_offer(to, message).deliver
  end
end
