class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :cart_id
      t.integer :product_id
      t.decimal :price
      t.string  :link
      t.integer :quantity
      t.integer :item_type_id
      t.decimal :additional
      t.integer :estimated_time_of_arrival_id
      t.string :item_screenshot
      t.string :additional_shipping_fee
      t.timestamps
    end
  end
end
