# create_table "image_galleries", force: :cascade do |t|
#   t.string "image"
#   t.string "product_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class ImageGallery < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product, optional: true
end
