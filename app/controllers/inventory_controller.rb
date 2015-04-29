class InventoryController < ApplicationController 
	before_action :authorize

  def index
  	@products = Product.paginate(page: params[:page] || 1, per_page: 50)
                       .order('created_at DESC')
    @actions = ['Change status','publish','delete','archive']
  end

end
