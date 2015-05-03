class ProductsController < ApplicationController

  def index
    @products = Product.where(status: 'published')
                .paginate(page: params[:page] || 1, per_page: 50)
                .order('created_at DESC')
  end

  def new
  end

  def create
    url = params[:url]
    if url.include? 'forever21'
      Product.add_f21(url)
    elsif url.include? 'hm.com'
      Product.add_hm(url)
    elsif url.include? 'express.com'
      Product.add_express(url)
    elsif url.include? 'urbanoutfitters'
      Product.add_urban(url)
    elsif url.include? 'nastygal'
      Product.add_nastygal(url)
    else
      flash[:notice] = 'This brand cannot be added'
      redirect_to '/products/new'
    end
    redirect_to root_path
  end

  def search
    if params[:filter]
      keyword = params[:filter].downcase
      @products = Product.filter('category', keyword)
    else  
      term = params[:search_term].downcase
      @products = Product.search(term)
    end

    @products = @products.paginate(page: params[:page] || 1, per_page: 50)
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: { msg: "#{product.name} removed from inventory" }
  end
end
