# Model for ImageGallery
class ImageGallery < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product, optional: true
end
