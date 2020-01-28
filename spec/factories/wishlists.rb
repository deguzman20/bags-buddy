FactoryBot.define do
  factory :wishlist do
    product_id { 1 }
    user_id { 1 }
    quantity { 10 }
  end
end
