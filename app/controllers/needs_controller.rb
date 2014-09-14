class NeedsController < ApplicationController
  before_filter :generate_defaults
  
  def index
  end

  def create
  	@need = current_user.needs.create(need_params)

  	# params[:need][:category_ids].each do |category_id|
  	# 	@need.need_categories << 
  	# end

  	if @need.save
  		redirect_to current_user, notice: 'Need created'
  	else
  		flash[:need_errors] = @need.errors.full_messages
  		redirect_to current_user
  	end

  end

  private
    def need_params
      params.require(:need).permit( :user_id, :title, :body, category_ids: [])
    end

    def generate_defaults
      @categories = Category.all
      @needs_list = Need.recent
    end

end
