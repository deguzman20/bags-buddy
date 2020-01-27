# create_table "estimated_time_of_arrivals", force: :cascade do |t|
#   t.string "name"
#   t.decimal "additional_shipping_fee"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class EstimatedTimeOfArrival < ApplicationRecord
  has_many :cart_products
end
