# Model for Category
class Category < ApplicationRecord
  has_many :pre_orders
  has_many :products

  has_many :brand_categories
  has_many :brands, through: :brand_categories
end
