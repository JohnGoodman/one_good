class NeedsController < ApplicationController
  before_filter :generate_defaults
  
  def index
  end

  def create
  	@need = current_user.needs.create(need_params)

  	if @need.save
  		redirect_to current_user, notice: 'Need created'
  	else
  		flash[:need_errors] = @need.errors.full_messages
  		redirect_to current_user
  	end

  end

  def show
    @need = Need.find(params[:id])
    @help_offer = HelpOffer.new
    @help_offers = @need.help_offers
    @current_user_already_offered = current_user.blank? ? false : @need.help_offers.map{|h| h.user_id}.include?(current_user.id)
    if @current_user_already_offered
      @existing_help_offer = current_user.help_offers.find_by(need_id: @need.id)
    end
  end

  private
    def need_params
      params.require(:need).permit( :user_id, :title, :body, category_ids: [])
    end

    def generate_defaults
      @categories = Category.all
      @needs_list = Need.search(params)
    end

end
