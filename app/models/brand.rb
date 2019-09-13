class Brand < ApplicationRecord
	mount_uploader :image, ImageUploader
  has_one :portal
  has_one :product

  has_many :brand_categories
  has_many :categories, through: :brand_categories
end

