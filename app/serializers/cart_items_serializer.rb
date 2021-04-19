class CartItemsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quantity
end
