class CreateImageGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :image_galleries do |t|
      t.string :image
      t.string :product_id

      t.timestamps
    end
  end
end
