class CreatePreOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :pre_orders do |t|
      t.string :link
      t.string :image
      t.decimal :additional_price
      t.string :category_id
      t.string :brand_id
      t.datetime :eta_air
      t.datetime :eta_sea
      t.text :instruction
      t.timestamps
    end
  end
end
