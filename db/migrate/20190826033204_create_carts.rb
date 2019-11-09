class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    remove_column :carts, :user_id
  end  
end
