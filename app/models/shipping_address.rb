# create_table "shipping_addresses", force: :cascade do |t|
#   t.integer "user_id"
#   t.string "first_name"
#   t.string "last_name"
#   t.string "address"
#   t.string "apartment"
#   t.integer "city_id"
#   t.integer "state_id"
#   t.string "email"
#   t.string "mobile_number"
#   t.boolean "is_save_info"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class ShippingAddress < ApplicationRecord
  belongs_to :user
  has_many :orders
end
