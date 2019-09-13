class CreatePortals < ActiveRecord::Migration[5.2]
  def change
    create_table :portals do |t|
      t.string :link
      t.string :image
      t.decimal :additional_price
      t.string :category_id
      t.string :brand_id

      t.timestamps
    end
  end
end
