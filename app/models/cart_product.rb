# Model for Cart Product
class CartProduct < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :product, optional: true
  belongs_to :item_type, optional: true
  belongs_to :estimated_time_of_arrival, optional: true
end
