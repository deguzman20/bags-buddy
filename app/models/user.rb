# create_table "users", force: :cascade do |t|
#   t.string "first_name"
#   t.string "last_name"
#   t.datetime "birthdate"
#   t.string "email", default: "", null: false
#   t.string "encrypted_password", default: "", null: false
#   t.boolean "admin"
#   t.string "reset_password_token"
#   t.datetime "reset_password_sent_at"
#   t.datetime "deleted_at"
#   t.datetime "remember_created_at"
#   t.integer "sign_in_count", default: 0, null: false
#   t.datetime "current_sign_in_at"
#   t.datetime "last_sign_in_at"
#   t.string "current_sign_in_ip"
#   t.string "last_sign_in_ip"
#   t.string "confirmation_token"
#   t.datetime "confirmed_at"
#   t.datetime "confirmation_sent_at"
#   t.string "unconfirmed_email"
#   t.integer "failed_attempts", default: 0, null: false
#   t.string "unlock_token"
#   t.datetime "locked_at"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["email"], name: "index_users_on_email", unique: true
#   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
# end
class User < ApplicationRecord
  rolify
  has_paper_trail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :trackable

  has_many :wishlists
  has_many :products, through: :wishlists

  has_one :cart
  has_many :orders
  has_many :shipping_addresses

  validates_uniqueness_of :email

  def update_password_with_password(params, *options)
    current_password = params.delete(:current_password)

    result = if valid_password?(current_password)
      update_attributes(params, *options)
    else
      assign_attributes(params, *options)
      valid?
      errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end

    clean_up_passwords
    result
  end

  # def decrypted_password
  #   Devise::Encryptable::Encryptors::Aes256.decrypt(password,
  #                                                   Devise.pepper)
  # end

  validates_presence_of :first_name
end
