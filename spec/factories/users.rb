FactoryBot.define do
  factory :user do
    first_name { "andy" }
    last_name { "deguzman" }
    birthdate { DateTime.now }
    email { "andy@gmail.com" }
    encrypted_password { "deguzman123" }
    admin { true }
  end
end
