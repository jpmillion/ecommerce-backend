class CartItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quantity, :price
  belongs_to :cart
end
