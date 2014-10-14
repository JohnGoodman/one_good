class HelpOffer < ActiveRecord::Base
	belongs_to :need
  belongs_to :user
  belongs_to :receiving_user, class_name: 'User'

  validates :help_message, presence: true

  def creator_name
    user.name
  end

  def reciever_name
    receiving_user.name
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
  end

  def decline_help_offer
    # Send email to user with the decline message
  end
end
