class CreateEstimatedTimeOfArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :estimated_time_of_arrivals do |t|
      t.string :name
      t.decimal :additional_shipping_fee

      t.timestamps
    end
  end
end
