class Customer < ApplicationRecord
  has_secure_password
  has_one :cart, dependent: :destroy
  has_many :cart_items, through: :cart
  has_many :orders
  has_many :order_items, through: :orders
  validates :email, uniqueness: :true
  validates :email, presence: :true
end
