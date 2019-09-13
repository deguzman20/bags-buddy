class CartProduct < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :product, optional: true
  belongs_to :item_type, optional: true
end
