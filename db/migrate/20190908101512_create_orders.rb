class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :order_status_id
      t.integer :payment_order_status_id
      t.integer :shipping_address_id
      t.decimal :balance
      t.decimal :down_payment
      t.decimal :total

      t.timestamps
    end
  end
end
