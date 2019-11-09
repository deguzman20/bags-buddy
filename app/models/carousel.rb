# Model for Carousel
class Carousel < ApplicationRecord
  mount_uploader :image, ImageUploader
end
