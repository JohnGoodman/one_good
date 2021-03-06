class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) do |u|
       u.permit(:name, :email, :city, :state, :password, :password_confirmation)
     end
  end

end