# create_table "carts", force: :cascade do |t|
#   t.integer "user_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class Cart < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :cart_products
  has_many :products, through: :cart_products
end
