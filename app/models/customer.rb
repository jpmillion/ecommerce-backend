class Customer < ApplicationRecord
  has_secure_password
  has_one :cart, dependent: :destroy
  has_many :orders
  validates :email, uniqueness: :true
  validates :email, presence: :true
end
