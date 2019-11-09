# Model for Cart
class Cart < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :cart_products
end
