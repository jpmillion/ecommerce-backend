class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :email, :cart, :orders, :cart_items, :order_items
  has_one :cart
  has_many :orders
  has_many :cart_items, through: :cart
  has_many :order_items, through: :order
end
