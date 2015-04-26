class AddClosetAndClicks < ActiveRecord::Migration
  def change
    create_table :closet_contents do |t|
      t.integer :product_id
      t.integer :user_id
      t.timestamps
    end

    create_table :product_clicks do |t|
    	t.integer :product_id
    	t.integer	:user_id
    	t.string :product_field
    	t.string :page_position
    	t.timestamps
    end

    add_column :products, :keywords, :string
    add_column :products, :popularity, :integer

    add_index :closet_contents, :user_id
    add_index :product_clicks, :user_id
  end

end
