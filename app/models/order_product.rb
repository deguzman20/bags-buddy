# create_table "order_products", force: :cascade do |t|
#   t.integer "order_id"
#   t.integer "product_id"
#   t.integer "batch_id"
#   t.decimal "sub_total"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class OrderProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :batch, optional: true
end
