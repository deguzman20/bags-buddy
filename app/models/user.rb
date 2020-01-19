# Model for User
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

  # validates :email, presence: true
  # validates :password, presence: true
end
