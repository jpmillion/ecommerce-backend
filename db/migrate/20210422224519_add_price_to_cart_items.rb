class AddPriceToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_items, :price, :numeric
  end
end
