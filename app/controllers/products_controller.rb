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
    redirect_to root_path 
  end

  def filter
    key = params[:filter].downcase 
    if key == 'all'
      redirect_to root_path
    else  
      @products = Product.where(category: "#{key}")
    end  
  end


  def search
    term = params[:search_term].downcase 
    @products = Product.all.select do |product|
      product if product.name.downcase.include? term      
    end  
  end    

end
