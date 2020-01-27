# create_table "wishlists", force: :cascade do |t|
#   t.integer "product_id"
#   t.integer "user_id"
#   t.integer "quantity"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class Wishlist < ApplicationRecord
  belongs_to :product
  belongs_to :user
end
