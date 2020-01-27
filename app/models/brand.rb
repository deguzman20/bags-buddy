# create_table "brands", force: :cascade do |t|
#   t.string "name"
#   t.string "logo"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class Brand < ApplicationRecord
  mount_uploader :logo, ImageUploader
  has_one :pre_order
  has_one :product

  has_many :brand_categories
  has_many :categories, through: :brand_categories
end
