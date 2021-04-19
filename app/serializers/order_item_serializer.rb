class OrderItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price, :title, :quantity
  belongs_to :order
end
