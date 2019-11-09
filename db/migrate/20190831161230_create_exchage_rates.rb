class CreateExchageRates < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_rates do |t|
      t.string :currency
      t.decimal :value

      t.timestamps
    end
  end
end
