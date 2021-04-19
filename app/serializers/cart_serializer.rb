class CartSerializer
  include FastJsonapi::ObjectSerializer
  attributes :total, :cart_items
  belongs_to :customer
  has_many :cart_items
end
