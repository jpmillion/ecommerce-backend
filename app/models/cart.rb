class Cart < ApplicationRecord
  belongs_to :customer
  has_many :cart_items

  def update_total(price, quantity)
    new_total = self.total + (price*quantity)
    self.update(total: new_total)
  end
end
