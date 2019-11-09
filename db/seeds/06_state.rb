if State.count.zero?
  State.create([
                 { id: 1, region: "National Capital Region", regional_designation: "NCR" },
                 { id: 2, region: "Ilocos Region", regional_designation: "Region I" },
                 { id: 3, region: "Cordillera Administrative Region", regional_designation: "CAR" },
                 { id: 4, region: "Cagayan Valley", regional_designation: "Region II" },
                 { id: 5, region: "Central Luzon", regional_designation: "Region III" },
                 { id: 6, region: "Southern Tagalog Mainland", regional_designation: "CALABARZON" },
                 { id: 7, region: "Southwestern Tagalog Region", regional_designation: "MIMAROPA" },
                 { id: 8, region: "Bicol Region", regional_designation: "Region V" },
                 { id: 9, region: "Western Visayas", regional_designation: "Region VI" },
                 { id: 10, region: "Central Visayas", regional_designation: "Region VII" },
                 { id: 11, region: "Eastern Visayas", regional_designation: "Region VIII" },
                 { id: 12, region: "Zamboanga Peninsula", regional_designation: "Region IX" },
                 { id: 13, region: "Northern Mindanao", regional_designation: "Region X" },
                 { id: 14, region: "Davao Region", regional_designation: "Region XI" },
                 { id: 15, region: "SOCCSKSARGEN", regional_designation: "Region XII" },
                 { id: 16, region: "Caraga Region", regional_designation: "Region XIII" },
                 { id: 17, region: "Bangsamoro Autonomous Region in Muslim Mindanao", regional_designation: "BARMM" }
               ])
  puts "Successfully seeded states table... Proceeding..."
else
  puts "State table has already been seeded... Proceeding..."
end
