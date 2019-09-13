class Category < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :portals
  has_many :products

  has_many :brand_categories
  has_many :brands, through: :brand_categories

end
