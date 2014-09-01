require 'nokogiri'
require 'open-uri'
require 'include_complete'

# require "./product_parser"

module Crawler
  include_complete Parser

  end
end

Crawler.results('http://www.forever21.com/Product/Category.aspx?br=f21&category=whatsnew_app&pagesize=100&page=1')

module Parser
  def self.f21(url)
    doc    = Nokogiri::HTML(open(url))
    name   = doc.css('h1.product-title')[0].children[0].text
    category = name.downcase.split(' ').last
    category = self.classify(category)
    price  = doc.css('p.product-price')[0].children[0].text
    image  = doc.css('#productLayer a')[0].attributes['href'].value
    brand = "Forever 21"
    { url:      url,
      image:    image,
      category: category,
      brand:    brand,
      name:     name,
      price:    price
    }
  end
end
