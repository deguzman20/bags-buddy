# Model for Exchange Rate
require "net/http"
require "json"
# Exchange Rate
class ExchangeRate < ApplicationRecord
  def self.update_exchange_rate
    url = "https://api.exchangerate-api.com/v4/latest/USD"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)

    # Getting a rate
    rate = response_obj["rates"]["PHP"]
    if count.zero?
      new_record = new
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
