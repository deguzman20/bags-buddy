# Model for Batch
class Batch < ApplicationRecord
  has_many :order_products
end
