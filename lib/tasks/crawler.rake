desc 'Fetch products'
task :site_crawler => :environment do
  Product.crawl_f21('http://www.forever21.com/Product/Category.aspx?br=f21&category=whatsnew_app&pagesize=100&page=1')
end
