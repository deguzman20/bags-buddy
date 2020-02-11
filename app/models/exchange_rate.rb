# create_table "exchange_rates", force: :cascade do |t|
#   t.string "currency"
#   t.decimal "value"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
require "net/http"
require "json"
# Exchange Rate
class ExchangeRate < ApplicationRecord
  alias_attribute :amount, :value

  def self.update_exchange_rate
    url = "https://api.exchangerate-api.com/v4/latest/USD"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)

    # Getting a rate
    rate = response_obj["rates"]["PHP"]
    if count.zero?
      new_record = neww
      new_record.currency = "PHP"
      new_record.value = rate
      new_record.save
    else
      # Delete exchange rate
      first_record = first
      first_record.value = rate
      first_record.save
    end
  end
end
