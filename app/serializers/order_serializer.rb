class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :total
  belongs_to :customer
end
