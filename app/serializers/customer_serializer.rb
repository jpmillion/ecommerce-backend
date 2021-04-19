class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :email, :cart, :orders
  has_one :cart
  has_many :orders
end
