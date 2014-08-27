class HelpOffer < ActiveRecord::Base
	belongs_to :need
  belongs_to :user
  belongs_to :receiving_user
end
