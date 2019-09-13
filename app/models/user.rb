class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart
  has_many :orders

  # def decrypted_password
  #   Devise::Encryptable::Encryptors::Aes256.decrypt(password,
  #                                                   Devise.pepper)
  # end

  # validates :email, presence: true
  # validates :password, presence: true

end
