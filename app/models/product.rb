# create_table "products", force: :cascade do |t|
#   t.string "name"
#   t.string "image"
#   t.integer "price"
#   t.integer "category_id"
#   t.integer "brand_id"
#   t.integer "quantity"
#   t.text "product_description"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :wishlists
  has_many :users, through: :wishlists

  belongs_to :category
  belongs_to :brand
  has_many :cart_products
  has_many :cart, through: :cart_products

  has_many :order_products
  has_many :orders, through: :order_products
  has_many :image_galleries

  validates_presence_of :name, :image, :price, :product_description
end
