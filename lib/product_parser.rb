require 'nokogiri'
require 'open-uri'

module Parser
  def self.crawl_f21(page_url)
    doc = Nokogiri::HTML(open(page_url))
    product_urls = (0..99).map do |index|
      index = '0' + index.to_s if index < 10
      doc.css("#ctl00_MainContent_dlCategoryList_ctl#{index}_dvContainer a")[0].attributes['href'].value
    end
  end

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

  def self.hm(url)
    doc      = Nokogiri::HTML(open(url))
    name     = doc.css('#product h1')[0].children[0].content
    name     = name.gsub("\r\n", "").strip
    category = name.downcase.split(' ').last
    category = self.classify(category)
    price    = doc.css('#text-price.price')[0].children[1].children[0].content
    image    = doc.css('#product-image')[0].attributes['src'].value
    image    = "http:#{image}"
    brand    = "H&M"
  end

  def self.express(url)
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
  end

  def self.urban(url)
    doc      = Nokogiri::HTML(open(url))
    name     = name = doc.css('h2#prodTitle')[0].children.text
    category = name.downcase.split(' ').last
    category = self.classify(category)
    price    = doc.css('#prodOptions h2 span')[0].children.text
    price    = price.delete("\r\n\t")
    image = doc.css('img#prodMainImg')[0].attributes['src'].value
    image    = "http:#{image}"
    brand    = "Urban Outfitters"
  end

  def self.nastygal(url)
    doc      = Nokogiri::HTML(open(url))
    name     = doc.css('h1.product-name')[0].children[0].text
    name     = name.gsub('Nasty Gal ', '')
    category = name.split(' ').last.downcase
    category = self.classify(category)
    price = doc.css('.current-price').last.children[0].text
    image = doc.css('#product-images-carousel')[0].children[1].children[1].attributes['src'].value
    image    = "http:#{image}"
    brand    = "Nasty Gal"
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
    elsif ['top','shirt', 'tank', 'blouse', 'tee', 'cami', 'bustier', 'sweatshirt'].include? category
      category = 'top'
    elsif ['jacket','blazer', 'coat'].include? category
      category = 'jacket'
    elsif ['bikini', 'bra', 'boyshort'].include? category
      category = 'intimates'
    else
      category = 'accessories'
    end
  return category
  end
end


