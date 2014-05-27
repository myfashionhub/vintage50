class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :brand
      t.string :name
      t.string :category
      t.float :price

      t.timestamps
    end
  end
end
