require "#{Rails.root}/lib/category.rb"
#include Category

desc 'Fetch products'
task :crawl_f21 => :environment do
  Product.crawl_f21('http://www.forever21.com/Product/Category.aspx?br=f21&category=whatsnew_app&pagesize=100&page=2')
end

task :crawl_nastygal => :environment do
  Product.crawl_nastygal('http://nastygal.com/clothes?page=4')
end


desc 'Update product category'
task :update_category => :environment do
  Category.update
end
