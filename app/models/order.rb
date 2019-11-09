# Model for Order
class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :order_status, optional: true
  belongs_to :payment_order_status
  belongs_to :shipping_address
  has_many :order_products
end
