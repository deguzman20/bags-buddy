# create_table "pre_orders", force: :cascade do |t|
#   t.string "link"
#   t.string "image"
#   t.decimal "additional_price"
#   t.string "category_id"
#   t.string "brand_id"
#   t.datetime "eta_air"
#   t.datetime "eta_sea"
#   t.text "instruction"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class PreOrder < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :brand
end
