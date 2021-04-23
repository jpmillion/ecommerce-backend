class Cart < ApplicationRecord
  belongs_to :customer
  has_many :cart_items

  def update_total
    new_total = self.cart_items.reduce(0) {|sum, item| sum + (item.price * item.quantity)}
    self.update(total: new_total)
  end
end
