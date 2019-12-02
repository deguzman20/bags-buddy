class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.datetime :from, null: false
      t.datetime :to, null: false
      t.timestamps
    end
  end
end
