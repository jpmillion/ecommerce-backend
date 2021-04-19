class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :total, :order_items
  belongs_to :customer
  has_many :order_items
end
