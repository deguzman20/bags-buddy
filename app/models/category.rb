class Category < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :portals
  has_many :products
  # belongs_to :brand, optional: true
end
