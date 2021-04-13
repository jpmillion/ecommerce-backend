class Customer < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: :true
  validates :email, presence: :true
end
