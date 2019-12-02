if EstimatedTimeOfArrival.count.zero?
  EstimatedTimeOfArrival.create!([
                                   { name: "Sea" },
                                   { name: "Air" }
                                 ])
  puts "Successfully seeded estimated time of arrival table... Proceeding..."
else
  puts "City table has already been seeded... Proceeding..."
end
