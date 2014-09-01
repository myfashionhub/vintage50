module Category
  def self.update
    intimates = Product.all.where('name LIKE ? OR name LIKE ?', '%Bra%', '%Bralette%')
    intimates.each do |product|
      product.update(category: 'intimates')
    end
  end
end
