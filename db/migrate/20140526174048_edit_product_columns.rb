class EditProductColumns < ActiveRecord::Migration
  def change
    change_column :products, :price, :string
    add_column    :products, :url, :string
  end
end
