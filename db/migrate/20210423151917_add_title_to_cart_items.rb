class AddTitleToCartItems < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_items, :title, :string
    add_column :cart_items, :description, :string
    add_column :cart_items, :image, :string
  end
end
