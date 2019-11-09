class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :apartment
      t.integer :city_id
      t.integer :state_id
      t.string :email
      t.string :mobile_number
      t.boolean :is_save_info 
      t.timestamps
    end
  end
end
