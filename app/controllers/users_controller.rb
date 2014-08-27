class UsersController < ApplicationController

  def show
  	@needs = current_user.needs
  	@help_offers = current_user.help_offers
  	@new_need = Need.new
  end
end
