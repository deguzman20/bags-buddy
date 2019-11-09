FactoryBot.define do
  factory :shipping_address do
    user_id { 1 }
    first_name { "MyString" }
    last_name { "MyString" }
    address { "MyString" }
    apartment { "MyString" }
    city_id { 1 }
    state_id { 1 }
    postal_code { "MyString" }
  end
end
