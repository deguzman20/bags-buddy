# create_table "categories", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class Category < ApplicationRecord
  has_many :pre_orders
  has_many :products

  has_many :brand_categories
  has_many :brands, through: :brand_categories
end
