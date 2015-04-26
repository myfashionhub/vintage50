class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :brand
      t.string :name
      t.string :category
      t.string :price
      t.string :url
      t.text :image

      t.timestamps
    end
  end
end
