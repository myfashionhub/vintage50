class ProductsController < ApplicationController

  def index
    @products = Product.paginate(page: params[:page] || 1, per_page: 50)
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

  def filter
    keyword = params[:filter].downcase
    if keyword == 'all'
      redirect_to root_path
    else
      @products = Product.where(category: "#{keyword}")
    end
  end

  def search
    term = params[:search_term].downcase
    @products = Product.search(term)
  end

end
