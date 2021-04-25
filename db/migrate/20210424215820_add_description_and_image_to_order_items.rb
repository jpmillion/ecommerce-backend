class AddDescriptionAndImageToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :description, :string
    add_column :order_items, :image, :string
  end
end
