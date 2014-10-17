class HelpOffersController < ApplicationController
	def create
		@help_offer = HelpOffer.create(help_offer_params)
		need = @help_offer.need

		@help_offer.status = 'pending'
		@help_offer.receiving_user_id = need.user.id
		@help_offer.user = current_user

		if @help_offer.save
			redirect_to root_path, notice: 'Your offer has been sent to ' + need.user.name
		else
			redirect_to :back, alert: @help_offer.errors.full_messages.join('. ')
		end
	end	

	def show
		@help_offer = HelpOffer.find(params[:id])
	end

	def update
		help_offer = HelpOffer.find(params[:id])

		if params[:accept].present?
			help_offer.accept_message = params[:message]
			help_offer.status = 'accepted'
			notice = 'You have accepted this help offer'
			method = 'accept_help_offer'
		
		elsif params[:decline].present?
			help_offer.decline_message = params[:message]
			help_offer.status = 'declined'
			notice = 'You have declined this help offer'
			method = 'decline_help_offer'
		end

		if params[:message].present?
			help_offer.save
			help_offer.send(method)
		else
			alert = 'Please enter a message to ' + help_offer.creator_name
			notice = nil
		end

		redirect_to help_offer, notice: notice, alert: alert
	end

	private
    def help_offer_params
      params.require(:help_offer).permit( :user_id, :need_id, :receiving_user_id, :status, :help_message)

    end
end