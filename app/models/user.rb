class User < ActiveRecord::Base
	has_many :needs
	has_many :help_offers
	has_many :receiving_help_offers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def email_name
  	name + " <" + email + ">"
  end

end
