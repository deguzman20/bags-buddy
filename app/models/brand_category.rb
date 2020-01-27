# create_table "brand_categories", force: :cascade do |t|
#   t.integer "brand_id"
#   t.integer "category_id"
#   t.decimal "additional"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class BrandCategory < ApplicationRecord
  belongs_to :category
  belongs_to :brand
end
