class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string  :name
      t.string  :image
      t.integer :price
      t.integer :category_id
      t.integer :brand_id
      t.integer :quantity
      t.text    :product_description
      t.timestamps
    end
  end
end
