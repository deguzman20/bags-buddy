namespace :exchange_rate do
  desc "Update Currency"
  task update_exchange_rate: :environment do
    ExchangeRate.update_exchange_rate
  end
end
