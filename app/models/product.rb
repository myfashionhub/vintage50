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
    doc      = Nokogiri::HTML(open(url))
    name     = doc.css('#product h1')[0].children[0].content
    name     = name.gsub("\r\n", "").strip
    category = name.downcase.split(' ').last
    category = self.classify(category)
    price    = doc.css('#text-price.price')[0].children[1].children[0].content
    image    = doc.css('#product-image')[0].attributes['src'].value
    image    = "http:#{image}"
    brand    = "H&M"

    self.create(
      url:      url,
      image:    image,
      category: category,
      brand:    brand,
      name:     name,
      price:    price
    )
  end

  def self.add_express(url)
    doc      = Nokogiri::HTML(open(url))
    name     = doc.css('#cat-pro-con-detail h1')[0].children[0].content
    name     = name.downcase.capitalize
    category = name.split(' ').last
    category = self.classify(category)
    price   = doc.css('.glo-tex-normal')[0].children[1].children[1].children.text
    price    = "$#{price}"
    image    = doc.css('#cat-prod-flash')[0].children[1].children[0].content
    image    = image.delete("\n{};,\"=").gsub('var','').gsub('zoomerPageVars','').gsub('serverURL:','').gsub('imageSet: ','').strip
    brand    = "Express"

    self.create(
      url:      url,
      image:    image,
      category: category,
      brand:    brand,
      name:     name,
      price:    price
    )
  end

  def self.add_urban(url)
    doc      = Nokogiri::HTML(open(url))
    name     = name = doc.css('h2#prodTitle')[0].children.text
    category = name.downcase.split(' ').last
    category = self.classify(category)
    price    = doc.css('#prodOptions h2 span')[0].children.text
    price    = price.delete("\r\n\t")
    image = doc.css('img#prodMainImg')[0].attributes['src'].value
    image    = "http:#{image}"
    brand    = "Urban Outfitters"

    self.create(
      url:      url,
      image:    image,
      category: category,
      brand:    brand,
      name:     name,
      price:    price
    )
  end

  def self.add_nastygal(url)
    doc      = Nokogiri::HTML(open(url))
    name     = doc.css('h1.product-name')[0].children[0].text
    name     = name.gsub('Nasty Gal ', '')
    category = name.split(' ').last.downcase
    category = self.classify(category)
    price = doc.css('.current-price').last.children[0].text
    image = doc.css('#product-images-carousel')[0].children[1].children[1].attributes['src'].value
    image    = "http:#{image}"
    brand    = "Nasty Gal"

    self.create(
      url:      url,
      image:    image,
      category: category,
      brand:    brand,
      name:     name,
      price:    price
    )
  end


  def self.classify(category)
    if ['dress'].include? category
      category = 'dress'
    elsif ['skirt'].include? category
      category = 'skirt'
    elsif ['romper','jumpsuit'].include? category
      category = 'one piece'
    elsif ['shorts','pants', 'jeans', 'leggings', 'tights'].include? category
      category = 'bottoms'
    elsif ['top','shirt', 'tank', 'blouse', 'tee', 'cami', 'bustier'].include? category
      category = 'top'
    elsif ['jacket','blazer', 'coat'].include? category
      category = 'jacket'
    end
  return category
  end

end
