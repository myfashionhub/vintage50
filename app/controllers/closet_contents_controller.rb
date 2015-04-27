class ClosetContentsController < ApplicationController

	def index
		product_ids = ClosetContent.where(user_id: current_user.id)
		@products = product_ids.map do |id|
			Product.find(id)
		end
		if !@products.empty?
			@products.paginate(:page => params[:page] || 1, per_page: 20)
			         .order('created_at DESC')
		end
	end

	def create
	end

	def destroy
	end
end
