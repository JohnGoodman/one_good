class User < ActiveRecord::Base
	has_many :needs
	has_many :help_offers
	has_many :receiving_help_offers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :city, :state, presence: true
  validates :password, presence: true, if: :password_required?

  def email_name
  	name + " <" + email + ">"
  end

  private

  def password_required?
    # If resetting the password
    return true if reset_password_token.present? && reset_password_period_valid?

     # If the person already has a pass, only validate if they are updating pass
    if !encrypted_password.blank?
      password.present? || password_confirmation.present?
    end
  end

end
