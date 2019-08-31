class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :image
      # t.integer :brand_id

      t.timestamps
    end
  end
end
