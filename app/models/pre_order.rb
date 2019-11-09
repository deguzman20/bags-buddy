# Model for Portal
class PreOrder < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :brand
end
