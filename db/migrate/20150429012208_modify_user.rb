class ModifyUser < ActiveRecord::Migration
  def up
  	rename_column :users, :products_id, :role
  	change_column :users, :role, :string
  	add_column :products, :status, :string 
  end

  def down
  	rename_column :users, :role, :products_id
  	change_column :users, :products_id, :integer
  	remove_column :products, :status
  end
end
