require 'open-uri'
require "#{Rails.root}/lib/product_parser"

class Product < ActiveRecord::Base
  validates :url, uniqueness: true

  def self.crawl_f21(page_url)
    product_urls = Parser.crawl_f21(page_url)
    product_urls.map do |product_url|
      self.find_or_create_by(Parser.f21(product_url))
    end
  end

  def self.add_hm(url)
  end

  def self.add_express(url)
  end

  def self.add_urban(url)
  end

  def self.crawl_nastygal(page_url)
    product_urls = Parser.crawl_nastygal(page_url).compact
    product_urls.map do |product_url|
      self.find_or_create_by(Parser.nastygal(product_url))
    end
  end

  def self.filter(attribute,keyword)
    attribute = attribute.downcase.to_sym
    if keyword == 'all'
      Product.all
    else
      Product.where(attribute => "#{keyword}")
    end    
  end

  def self.search(term)
    Product.all.select do |product|
      product.name.downcase.include?(term) || 
      product.brand.downcase.include?(term) || 
      product.category.include?(term)
    end
  end

  def self.categories 
    categories = [ 
      'All','Dress','Top',
      'Skirt', 'One piece', 'Bottoms', 
      'Jacket', 'Intimates', 'Accessories'
    ]     
  end

  def self.actions
    actions = ['Change status','Publish','Delete','Archive']
  end
end
