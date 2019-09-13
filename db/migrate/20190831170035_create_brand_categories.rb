class CreateBrandCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_categories do |t|
      t.integer :brand_id
      t.integer :category_id
      t.decimal :additional

      t.timestamps
    end
  end
end
