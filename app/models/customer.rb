class Customer < ApplicationRecord
  has_secure_password
  has_one :cart, dependent: :destroy
  validates :email, uniqueness: :true
  validates :email, presence: :true
end
