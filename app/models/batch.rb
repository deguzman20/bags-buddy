# create_table "batches", force: :cascade do |t|
#   t.datetime "from", null: false
#   t.datetime "to", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class Batch < ApplicationRecord
  has_many :order_products
end
