class ChangesInOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :subtotal, :decimal
    add_column :orders, :tax, :decimal
    add_column :orders, :shipping, :decimal
    add_column :orders, :total, :decimal
    add_column :orders, :order_status_id, :integer
  end
  def self.down
    remove_column :orders, :subtotal
    remove_column :orders, :tax
    remove_column :orders, :shipping
    remove_column :orders, :total
    remove_column :orders, :order_status_id
  end
end
