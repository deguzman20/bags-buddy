# product model
class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :brand
  has_one :cart_product
  has_many :order_products
end
