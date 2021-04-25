class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
end
