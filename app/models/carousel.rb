# create_table "carousels", force: :cascade do |t|
#   t.string "image"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class Carousel < ApplicationRecord
  mount_uploader :image, ImageUploader
end
