class OrderItemChanges < ActiveRecord::Migration
  def self.up
    add_column :order_items, :bracelet_id, :integer
    remove_column :order_items, :product_id, :integer
  end
  def self.down
    add_column :order_items, :product_id
    remove_column :order_items, :bracelet_id
  end
end
