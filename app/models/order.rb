# create_table "orders", force: :cascade do |t|
#   t.integer "user_id"
#   t.integer "order_status_id"
#   t.integer "payment_order_status_id"
#   t.integer "shipping_address_id"
#   t.decimal "balance"
#   t.decimal "down_payment"
#   t.decimal "total"
#   t.boolean "is_have_down_payment"
#   t.boolean "false"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :order_status, optional: true
  belongs_to :payment_order_status
  belongs_to :shipping_address
  has_many :order_products
  has_many :products, through: :order_products
end
