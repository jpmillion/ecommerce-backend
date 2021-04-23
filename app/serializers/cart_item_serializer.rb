class CartItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quantity, :price, :title, :description, :image
  belongs_to :cart
end
