# Model for Order Status
class OrderStatus < ApplicationRecord
  has_many :orders
end
