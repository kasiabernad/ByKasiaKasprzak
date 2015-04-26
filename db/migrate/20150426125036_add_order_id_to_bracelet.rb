class AddOrderIdToBracelet < ActiveRecord::Migration
  def self.up
    add_column :bracelets, :order_id, :integer
  end
  def self.down
    remove_column :bracelets, :order_id
  end
end
