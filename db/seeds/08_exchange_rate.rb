if ExchangeRate.count.zero?
  ExchangeRate.create([{ currency: "PHP", value: 51 }])
  puts "Successfully seeded exchange rate table... Proceeding..."
else
  puts "Exchange Rate table has already been seeded... Proceeding..."
end
