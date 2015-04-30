require "#{Rails.root}/lib/category.rb"
#include Category

desc 'Fetch products'
task :crawl_f21, [:page] => :environment do |t, arg|
  puts "http://www.forever21.com/Product/Category.aspx?br=f21&category=whatsnew_app&pagesize=100&page=#{arg.page}"
  Product.crawl_f21("http://www.forever21.com/Product/Category.aspx?br=f21&category=whatsnew_app&pagesize=100&page=#{arg.page}")
end

task :crawl_nastygal, [:page] => :environment do |t, arg|
  Product.crawl_nastygal("http://nastygal.com/clothes?page=#{arg.page}")
end


desc 'Update product category'
task :update_category => :environment do
  Category.update
end
