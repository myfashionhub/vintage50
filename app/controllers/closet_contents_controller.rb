class ClosetContentsController < ApplicationController

	def index
		product_ids = ClosetContent.where(user_id: current_user.id).map do |item|
			item.product_id
		end	
		@products = product_ids.map do |id|
			Product.find(id)
		end
		
		@products = @products.sort_by { |product| product.updated_at }
			         .paginate(:page => params[:page] || 1, per_page: 20)
	end

	def create
		ClosetContent.find_or_create_by(
			user_id: current_user.id,
			product_id: params[:product_id]
		)
		product = Product.find(params[:product_id])
		render json: { msg: "#{product.name} has been added to your closet." }
	end

	def destroy
		ClosetContent.find_by(
			user_id: current_user.id,
			product_id: params[:product_id]			
		).delete
		product = Product.find(params[:product_id])
		render json: { msg: "#{product.name} has been removed." }		
	end
end
