class ProductsController < ApplicationController

  def index
    @products = Product.all
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
    else
      flash[:notice] = 'This brand cannot be added'
    end  
    redirect_to '/products' 
  end

  def filter
    key = params[:filter].downcase 
    @products = Product.where(category: "#{key}")
  end  
end
