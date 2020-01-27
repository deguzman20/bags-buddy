# create_table "cart_products", force: :cascade do |t|
#   t.integer "cart_id"
#   t.integer "product_id"
#   t.decimal "price"
#   t.string "link"
#   t.integer "quantity"
#   t.integer "item_type_id"
#   t.decimal "additional"
#   t.integer "estimated_time_of_arrival_id"
#   t.string "item_screenshot"
#   t.string "additional_shipping_fee"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class CartProduct < ApplicationRecord
  mount_uploader :item_screenshot, ImageUploader

  belongs_to :cart, optional: true
  belongs_to :product, optional: true
  belongs_to :item_type, optional: true
  belongs_to :estimated_time_of_arrival, optional: true
end
