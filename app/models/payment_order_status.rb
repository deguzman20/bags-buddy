# payment order status model
class PaymentOrderStatus < ApplicationRecord
  has_many :orders
end
