class ChangesinBraceletsColumn < ActiveRecord::Migration
  def self.up
    remove_column :bracelets, :order_id
    remove_column :bracelets, :user_id
  end
  def self.down
    add_column :bracelets, :order_id, :integer
    add_column :bracelets, :user_id, :integer
  end
end
