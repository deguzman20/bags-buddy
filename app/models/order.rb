class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :order_status, optional: true
  has_many :order_products
end
