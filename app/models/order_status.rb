# create_table "order_statuses", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class OrderStatus < ApplicationRecord
  has_many :orders
end
