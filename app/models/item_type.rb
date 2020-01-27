# create_table "item_types", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class ItemType < ApplicationRecord
  has_many :cart_products
end
